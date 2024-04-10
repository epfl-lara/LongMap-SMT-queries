; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107220 () Bool)

(assert start!107220)

(declare-fun b!1271003 () Bool)

(declare-fun e!724651 () Bool)

(assert (=> b!1271003 (= e!724651 false)))

(declare-fun lt!574800 () Bool)

(declare-datatypes ((array!83074 0))(
  ( (array!83075 (arr!40074 (Array (_ BitVec 32) (_ BitVec 64))) (size!40610 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83074)

(declare-datatypes ((List!28509 0))(
  ( (Nil!28506) (Cons!28505 (h!29714 (_ BitVec 64)) (t!42038 List!28509)) )
))
(declare-fun arrayNoDuplicates!0 (array!83074 (_ BitVec 32) List!28509) Bool)

(assert (=> b!1271003 (= lt!574800 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28506))))

(declare-fun b!1271004 () Bool)

(declare-fun res!845694 () Bool)

(assert (=> b!1271004 (=> (not res!845694) (not e!724651))))

(declare-datatypes ((V!49071 0))(
  ( (V!49072 (val!16529 Int)) )
))
(declare-datatypes ((ValueCell!15601 0))(
  ( (ValueCellFull!15601 (v!19166 V!49071)) (EmptyCell!15601) )
))
(declare-datatypes ((array!83076 0))(
  ( (array!83077 (arr!40075 (Array (_ BitVec 32) ValueCell!15601)) (size!40611 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83076)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271004 (= res!845694 (and (= (size!40611 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40610 _keys!1364) (size!40611 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271005 () Bool)

(declare-fun e!724653 () Bool)

(declare-fun tp_is_empty!32909 () Bool)

(assert (=> b!1271005 (= e!724653 tp_is_empty!32909)))

(declare-fun res!845695 () Bool)

(assert (=> start!107220 (=> (not res!845695) (not e!724651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107220 (= res!845695 (validMask!0 mask!1730))))

(assert (=> start!107220 e!724651))

(declare-fun e!724649 () Bool)

(declare-fun array_inv!30481 (array!83076) Bool)

(assert (=> start!107220 (and (array_inv!30481 _values!1134) e!724649)))

(assert (=> start!107220 true))

(declare-fun array_inv!30482 (array!83074) Bool)

(assert (=> start!107220 (array_inv!30482 _keys!1364)))

(declare-fun b!1271006 () Bool)

(declare-fun e!724650 () Bool)

(assert (=> b!1271006 (= e!724650 tp_is_empty!32909)))

(declare-fun b!1271007 () Bool)

(declare-fun res!845696 () Bool)

(assert (=> b!1271007 (=> (not res!845696) (not e!724651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83074 (_ BitVec 32)) Bool)

(assert (=> b!1271007 (= res!845696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271008 () Bool)

(declare-fun mapRes!50944 () Bool)

(assert (=> b!1271008 (= e!724649 (and e!724650 mapRes!50944))))

(declare-fun condMapEmpty!50944 () Bool)

(declare-fun mapDefault!50944 () ValueCell!15601)

