; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107208 () Bool)

(assert start!107208)

(declare-fun b!1270895 () Bool)

(declare-fun res!845640 () Bool)

(declare-fun e!724559 () Bool)

(assert (=> b!1270895 (=> (not res!845640) (not e!724559))))

(declare-datatypes ((array!83050 0))(
  ( (array!83051 (arr!40062 (Array (_ BitVec 32) (_ BitVec 64))) (size!40598 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83050)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83050 (_ BitVec 32)) Bool)

(assert (=> b!1270895 (= res!845640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270896 () Bool)

(declare-fun e!724560 () Bool)

(declare-fun tp_is_empty!32897 () Bool)

(assert (=> b!1270896 (= e!724560 tp_is_empty!32897)))

(declare-fun mapIsEmpty!50926 () Bool)

(declare-fun mapRes!50926 () Bool)

(assert (=> mapIsEmpty!50926 mapRes!50926))

(declare-fun res!845641 () Bool)

(assert (=> start!107208 (=> (not res!845641) (not e!724559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107208 (= res!845641 (validMask!0 mask!1730))))

(assert (=> start!107208 e!724559))

(declare-datatypes ((V!49055 0))(
  ( (V!49056 (val!16523 Int)) )
))
(declare-datatypes ((ValueCell!15595 0))(
  ( (ValueCellFull!15595 (v!19160 V!49055)) (EmptyCell!15595) )
))
(declare-datatypes ((array!83052 0))(
  ( (array!83053 (arr!40063 (Array (_ BitVec 32) ValueCell!15595)) (size!40599 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83052)

(declare-fun e!724563 () Bool)

(declare-fun array_inv!30471 (array!83052) Bool)

(assert (=> start!107208 (and (array_inv!30471 _values!1134) e!724563)))

(assert (=> start!107208 true))

(declare-fun array_inv!30472 (array!83050) Bool)

(assert (=> start!107208 (array_inv!30472 _keys!1364)))

(declare-fun b!1270897 () Bool)

(declare-fun res!845642 () Bool)

(assert (=> b!1270897 (=> (not res!845642) (not e!724559))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270897 (= res!845642 (and (= (size!40599 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40598 _keys!1364) (size!40599 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270898 () Bool)

(assert (=> b!1270898 (= e!724559 false)))

(declare-fun lt!574782 () Bool)

(declare-datatypes ((List!28505 0))(
  ( (Nil!28502) (Cons!28501 (h!29710 (_ BitVec 64)) (t!42034 List!28505)) )
))
(declare-fun arrayNoDuplicates!0 (array!83050 (_ BitVec 32) List!28505) Bool)

(assert (=> b!1270898 (= lt!574782 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28502))))

(declare-fun b!1270899 () Bool)

(assert (=> b!1270899 (= e!724563 (and e!724560 mapRes!50926))))

(declare-fun condMapEmpty!50926 () Bool)

(declare-fun mapDefault!50926 () ValueCell!15595)

