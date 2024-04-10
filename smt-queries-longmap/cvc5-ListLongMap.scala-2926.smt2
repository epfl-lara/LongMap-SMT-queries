; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41726 () Bool)

(assert start!41726)

(declare-fun b_free!11365 () Bool)

(declare-fun b_next!11365 () Bool)

(assert (=> start!41726 (= b_free!11365 (not b_next!11365))))

(declare-fun tp!40099 () Bool)

(declare-fun b_and!19721 () Bool)

(assert (=> start!41726 (= tp!40099 b_and!19721)))

(declare-fun mapNonEmpty!20872 () Bool)

(declare-fun mapRes!20872 () Bool)

(declare-fun tp!40098 () Bool)

(declare-fun e!272360 () Bool)

(assert (=> mapNonEmpty!20872 (= mapRes!20872 (and tp!40098 e!272360))))

(declare-fun mapKey!20872 () (_ BitVec 32))

(declare-datatypes ((V!18163 0))(
  ( (V!18164 (val!6441 Int)) )
))
(declare-datatypes ((ValueCell!6053 0))(
  ( (ValueCellFull!6053 (v!8728 V!18163)) (EmptyCell!6053) )
))
(declare-datatypes ((array!29367 0))(
  ( (array!29368 (arr!14113 (Array (_ BitVec 32) ValueCell!6053)) (size!14465 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29367)

(declare-fun mapRest!20872 () (Array (_ BitVec 32) ValueCell!6053))

(declare-fun mapValue!20872 () ValueCell!6053)

(assert (=> mapNonEmpty!20872 (= (arr!14113 _values!833) (store mapRest!20872 mapKey!20872 mapValue!20872))))

(declare-fun b!465914 () Bool)

(declare-fun e!272361 () Bool)

(assert (=> b!465914 (= e!272361 true)))

(declare-datatypes ((tuple2!8438 0))(
  ( (tuple2!8439 (_1!4230 (_ BitVec 64)) (_2!4230 V!18163)) )
))
(declare-datatypes ((List!8532 0))(
  ( (Nil!8529) (Cons!8528 (h!9384 tuple2!8438) (t!14482 List!8532)) )
))
(declare-datatypes ((ListLongMap!7351 0))(
  ( (ListLongMap!7352 (toList!3691 List!8532)) )
))
(declare-fun lt!210456 () ListLongMap!7351)

(declare-fun zeroValue!794 () V!18163)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29369 0))(
  ( (array!29370 (arr!14114 (Array (_ BitVec 32) (_ BitVec 64))) (size!14466 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29369)

(declare-fun minValueAfter!38 () V!18163)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2144 (array!29369 array!29367 (_ BitVec 32) (_ BitVec 32) V!18163 V!18163 (_ BitVec 32) Int) ListLongMap!7351)

(assert (=> b!465914 (= lt!210456 (getCurrentListMap!2144 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18163)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!210457 () ListLongMap!7351)

(declare-fun +!1650 (ListLongMap!7351 tuple2!8438) ListLongMap!7351)

(assert (=> b!465914 (= lt!210457 (+!1650 (getCurrentListMap!2144 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8439 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465915 () Bool)

(declare-fun res!278512 () Bool)

(declare-fun e!272363 () Bool)

(assert (=> b!465915 (=> (not res!278512) (not e!272363))))

(assert (=> b!465915 (= res!278512 (and (= (size!14465 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14466 _keys!1025) (size!14465 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!278510 () Bool)

(assert (=> start!41726 (=> (not res!278510) (not e!272363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41726 (= res!278510 (validMask!0 mask!1365))))

(assert (=> start!41726 e!272363))

(declare-fun tp_is_empty!12793 () Bool)

(assert (=> start!41726 tp_is_empty!12793))

(assert (=> start!41726 tp!40099))

(assert (=> start!41726 true))

(declare-fun array_inv!10192 (array!29369) Bool)

(assert (=> start!41726 (array_inv!10192 _keys!1025)))

(declare-fun e!272362 () Bool)

(declare-fun array_inv!10193 (array!29367) Bool)

(assert (=> start!41726 (and (array_inv!10193 _values!833) e!272362)))

(declare-fun b!465916 () Bool)

(declare-fun e!272358 () Bool)

(assert (=> b!465916 (= e!272362 (and e!272358 mapRes!20872))))

(declare-fun condMapEmpty!20872 () Bool)

(declare-fun mapDefault!20872 () ValueCell!6053)

