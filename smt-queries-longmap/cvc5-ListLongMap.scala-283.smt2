; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4638 () Bool)

(assert start!4638)

(declare-fun b_free!1285 () Bool)

(declare-fun b_next!1285 () Bool)

(assert (=> start!4638 (= b_free!1285 (not b_next!1285))))

(declare-fun tp!5305 () Bool)

(declare-fun b_and!2119 () Bool)

(assert (=> start!4638 (= tp!5305 b_and!2119)))

(declare-fun mapIsEmpty!2018 () Bool)

(declare-fun mapRes!2018 () Bool)

(assert (=> mapIsEmpty!2018 mapRes!2018))

(declare-fun b!36234 () Bool)

(declare-fun res!21926 () Bool)

(declare-fun e!22885 () Bool)

(assert (=> b!36234 (=> (not res!21926) (not e!22885))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2495 0))(
  ( (array!2496 (arr!1191 (Array (_ BitVec 32) (_ BitVec 64))) (size!1292 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2495)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((V!2011 0))(
  ( (V!2012 (val!846 Int)) )
))
(declare-datatypes ((ValueCell!620 0))(
  ( (ValueCellFull!620 (v!1946 V!2011)) (EmptyCell!620) )
))
(declare-datatypes ((array!2497 0))(
  ( (array!2498 (arr!1192 (Array (_ BitVec 32) ValueCell!620)) (size!1293 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2497)

(assert (=> b!36234 (= res!21926 (and (= (size!1293 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1292 _keys!1833) (size!1293 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!36235 () Bool)

(declare-fun res!21928 () Bool)

(assert (=> b!36235 (=> (not res!21928) (not e!22885))))

(declare-datatypes ((List!950 0))(
  ( (Nil!947) (Cons!946 (h!1514 (_ BitVec 64)) (t!3663 List!950)) )
))
(declare-fun arrayNoDuplicates!0 (array!2495 (_ BitVec 32) List!950) Bool)

(assert (=> b!36235 (= res!21928 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!947))))

(declare-fun mapNonEmpty!2018 () Bool)

(declare-fun tp!5306 () Bool)

(declare-fun e!22883 () Bool)

(assert (=> mapNonEmpty!2018 (= mapRes!2018 (and tp!5306 e!22883))))

(declare-fun mapValue!2018 () ValueCell!620)

(declare-fun mapKey!2018 () (_ BitVec 32))

(declare-fun mapRest!2018 () (Array (_ BitVec 32) ValueCell!620))

(assert (=> mapNonEmpty!2018 (= (arr!1192 _values!1501) (store mapRest!2018 mapKey!2018 mapValue!2018))))

(declare-fun b!36236 () Bool)

(declare-fun tp_is_empty!1639 () Bool)

(assert (=> b!36236 (= e!22883 tp_is_empty!1639)))

(declare-fun b!36237 () Bool)

(declare-fun e!22881 () Bool)

(assert (=> b!36237 (= e!22881 tp_is_empty!1639)))

(declare-fun b!36238 () Bool)

(declare-fun res!21929 () Bool)

(assert (=> b!36238 (=> (not res!21929) (not e!22885))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!36238 (= res!21929 (validKeyInArray!0 k!1304))))

(declare-fun b!36239 () Bool)

(declare-fun e!22884 () Bool)

(assert (=> b!36239 (= e!22884 (and e!22881 mapRes!2018))))

(declare-fun condMapEmpty!2018 () Bool)

(declare-fun mapDefault!2018 () ValueCell!620)

