; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107222 () Bool)

(assert start!107222)

(declare-fun b!1271021 () Bool)

(declare-fun res!845705 () Bool)

(declare-fun e!724668 () Bool)

(assert (=> b!1271021 (=> (not res!845705) (not e!724668))))

(declare-datatypes ((V!49075 0))(
  ( (V!49076 (val!16530 Int)) )
))
(declare-datatypes ((ValueCell!15602 0))(
  ( (ValueCellFull!15602 (v!19167 V!49075)) (EmptyCell!15602) )
))
(declare-datatypes ((array!83078 0))(
  ( (array!83079 (arr!40076 (Array (_ BitVec 32) ValueCell!15602)) (size!40612 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83078)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83080 0))(
  ( (array!83081 (arr!40077 (Array (_ BitVec 32) (_ BitVec 64))) (size!40613 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83080)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(assert (=> b!1271021 (= res!845705 (and (= (size!40612 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40613 _keys!1364) (size!40612 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50947 () Bool)

(declare-fun mapRes!50947 () Bool)

(declare-fun tp!97288 () Bool)

(declare-fun e!724666 () Bool)

(assert (=> mapNonEmpty!50947 (= mapRes!50947 (and tp!97288 e!724666))))

(declare-fun mapKey!50947 () (_ BitVec 32))

(declare-fun mapValue!50947 () ValueCell!15602)

(declare-fun mapRest!50947 () (Array (_ BitVec 32) ValueCell!15602))

(assert (=> mapNonEmpty!50947 (= (arr!40076 _values!1134) (store mapRest!50947 mapKey!50947 mapValue!50947))))

(declare-fun b!1271022 () Bool)

(declare-fun e!724667 () Bool)

(declare-fun tp_is_empty!32911 () Bool)

(assert (=> b!1271022 (= e!724667 tp_is_empty!32911)))

(declare-fun mapIsEmpty!50947 () Bool)

(assert (=> mapIsEmpty!50947 mapRes!50947))

(declare-fun b!1271023 () Bool)

(assert (=> b!1271023 (= e!724666 tp_is_empty!32911)))

(declare-fun b!1271024 () Bool)

(assert (=> b!1271024 (= e!724668 false)))

(declare-fun lt!574803 () Bool)

(declare-datatypes ((List!28510 0))(
  ( (Nil!28507) (Cons!28506 (h!29715 (_ BitVec 64)) (t!42039 List!28510)) )
))
(declare-fun arrayNoDuplicates!0 (array!83080 (_ BitVec 32) List!28510) Bool)

(assert (=> b!1271024 (= lt!574803 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28507))))

(declare-fun b!1271025 () Bool)

(declare-fun res!845704 () Bool)

(assert (=> b!1271025 (=> (not res!845704) (not e!724668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83080 (_ BitVec 32)) Bool)

(assert (=> b!1271025 (= res!845704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271026 () Bool)

(declare-fun e!724665 () Bool)

(assert (=> b!1271026 (= e!724665 (and e!724667 mapRes!50947))))

(declare-fun condMapEmpty!50947 () Bool)

(declare-fun mapDefault!50947 () ValueCell!15602)

