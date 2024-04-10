; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4372 () Bool)

(assert start!4372)

(declare-fun b_free!1187 () Bool)

(declare-fun b_next!1187 () Bool)

(assert (=> start!4372 (= b_free!1187 (not b_next!1187))))

(declare-fun tp!4992 () Bool)

(declare-fun b_and!2005 () Bool)

(assert (=> start!4372 (= tp!4992 b_and!2005)))

(declare-fun mapIsEmpty!1852 () Bool)

(declare-fun mapRes!1852 () Bool)

(assert (=> mapIsEmpty!1852 mapRes!1852))

(declare-fun mapNonEmpty!1852 () Bool)

(declare-fun tp!4993 () Bool)

(declare-fun e!21418 () Bool)

(assert (=> mapNonEmpty!1852 (= mapRes!1852 (and tp!4993 e!21418))))

(declare-datatypes ((V!1879 0))(
  ( (V!1880 (val!797 Int)) )
))
(declare-datatypes ((ValueCell!571 0))(
  ( (ValueCellFull!571 (v!1890 V!1879)) (EmptyCell!571) )
))
(declare-datatypes ((array!2295 0))(
  ( (array!2296 (arr!1097 (Array (_ BitVec 32) ValueCell!571)) (size!1198 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2295)

(declare-fun mapKey!1852 () (_ BitVec 32))

(declare-fun mapValue!1852 () ValueCell!571)

(declare-fun mapRest!1852 () (Array (_ BitVec 32) ValueCell!571))

(assert (=> mapNonEmpty!1852 (= (arr!1097 _values!1501) (store mapRest!1852 mapKey!1852 mapValue!1852))))

(declare-fun b!33727 () Bool)

(declare-fun e!21417 () Bool)

(declare-fun tp_is_empty!1541 () Bool)

(assert (=> b!33727 (= e!21417 tp_is_empty!1541)))

(declare-fun b!33728 () Bool)

(assert (=> b!33728 (= e!21418 tp_is_empty!1541)))

(declare-fun b!33729 () Bool)

(declare-fun res!20484 () Bool)

(declare-fun e!21415 () Bool)

(assert (=> b!33729 (=> (not res!20484) (not e!21415))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33729 (= res!20484 (validKeyInArray!0 k!1304))))

(declare-fun b!33730 () Bool)

(declare-fun res!20485 () Bool)

(assert (=> b!33730 (=> (not res!20485) (not e!21415))))

(declare-datatypes ((array!2297 0))(
  ( (array!2298 (arr!1098 (Array (_ BitVec 32) (_ BitVec 64))) (size!1199 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2297)

(declare-datatypes ((List!887 0))(
  ( (Nil!884) (Cons!883 (h!1450 (_ BitVec 64)) (t!3588 List!887)) )
))
(declare-fun arrayNoDuplicates!0 (array!2297 (_ BitVec 32) List!887) Bool)

(assert (=> b!33730 (= res!20485 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!884))))

(declare-fun b!33732 () Bool)

(declare-fun e!21420 () Bool)

(assert (=> b!33732 (= e!21420 (and e!21417 mapRes!1852))))

(declare-fun condMapEmpty!1852 () Bool)

(declare-fun mapDefault!1852 () ValueCell!571)

