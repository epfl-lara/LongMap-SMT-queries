; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81972 () Bool)

(assert start!81972)

(declare-fun b!956131 () Bool)

(declare-fun e!538690 () Bool)

(assert (=> b!956131 (= e!538690 false)))

(declare-fun lt!430094 () Bool)

(declare-datatypes ((array!58121 0))(
  ( (array!58122 (arr!27940 (Array (_ BitVec 32) (_ BitVec 64))) (size!28419 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58121)

(declare-datatypes ((List!19469 0))(
  ( (Nil!19466) (Cons!19465 (h!20627 (_ BitVec 64)) (t!27830 List!19469)) )
))
(declare-fun arrayNoDuplicates!0 (array!58121 (_ BitVec 32) List!19469) Bool)

(assert (=> b!956131 (= lt!430094 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19466))))

(declare-fun mapNonEmpty!33478 () Bool)

(declare-fun mapRes!33478 () Bool)

(declare-fun tp!64056 () Bool)

(declare-fun e!538692 () Bool)

(assert (=> mapNonEmpty!33478 (= mapRes!33478 (and tp!64056 e!538692))))

(declare-datatypes ((V!32997 0))(
  ( (V!32998 (val!10556 Int)) )
))
(declare-datatypes ((ValueCell!10024 0))(
  ( (ValueCellFull!10024 (v!13111 V!32997)) (EmptyCell!10024) )
))
(declare-fun mapValue!33478 () ValueCell!10024)

(declare-datatypes ((array!58123 0))(
  ( (array!58124 (arr!27941 (Array (_ BitVec 32) ValueCell!10024)) (size!28420 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58123)

(declare-fun mapKey!33478 () (_ BitVec 32))

(declare-fun mapRest!33478 () (Array (_ BitVec 32) ValueCell!10024))

(assert (=> mapNonEmpty!33478 (= (arr!27941 _values!1197) (store mapRest!33478 mapKey!33478 mapValue!33478))))

(declare-fun b!956132 () Bool)

(declare-fun e!538691 () Bool)

(declare-fun tp_is_empty!21011 () Bool)

(assert (=> b!956132 (= e!538691 tp_is_empty!21011)))

(declare-fun b!956133 () Bool)

(assert (=> b!956133 (= e!538692 tp_is_empty!21011)))

(declare-fun b!956135 () Bool)

(declare-fun e!538689 () Bool)

(assert (=> b!956135 (= e!538689 (and e!538691 mapRes!33478))))

(declare-fun condMapEmpty!33478 () Bool)

(declare-fun mapDefault!33478 () ValueCell!10024)

