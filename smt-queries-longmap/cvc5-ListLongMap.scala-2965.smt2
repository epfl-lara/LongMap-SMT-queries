; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42046 () Bool)

(assert start!42046)

(declare-fun b_free!11599 () Bool)

(declare-fun b_next!11599 () Bool)

(assert (=> start!42046 (= b_free!11599 (not b_next!11599))))

(declare-fun tp!40815 () Bool)

(declare-fun b_and!20009 () Bool)

(assert (=> start!42046 (= tp!40815 b_and!20009)))

(declare-fun b!469421 () Bool)

(declare-fun res!280514 () Bool)

(declare-fun e!274866 () Bool)

(assert (=> b!469421 (=> (not res!280514) (not e!274866))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29827 0))(
  ( (array!29828 (arr!14338 (Array (_ BitVec 32) (_ BitVec 64))) (size!14690 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29827)

(declare-datatypes ((V!18475 0))(
  ( (V!18476 (val!6558 Int)) )
))
(declare-datatypes ((ValueCell!6170 0))(
  ( (ValueCellFull!6170 (v!8848 V!18475)) (EmptyCell!6170) )
))
(declare-datatypes ((array!29829 0))(
  ( (array!29830 (arr!14339 (Array (_ BitVec 32) ValueCell!6170)) (size!14691 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29829)

(assert (=> b!469421 (= res!280514 (and (= (size!14691 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14690 _keys!1025) (size!14691 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21238 () Bool)

(declare-fun mapRes!21238 () Bool)

(assert (=> mapIsEmpty!21238 mapRes!21238))

(declare-fun b!469422 () Bool)

(declare-fun e!274869 () Bool)

(assert (=> b!469422 (= e!274869 true)))

(declare-datatypes ((tuple2!8630 0))(
  ( (tuple2!8631 (_1!4326 (_ BitVec 64)) (_2!4326 V!18475)) )
))
(declare-datatypes ((List!8710 0))(
  ( (Nil!8707) (Cons!8706 (h!9562 tuple2!8630) (t!14670 List!8710)) )
))
(declare-datatypes ((ListLongMap!7543 0))(
  ( (ListLongMap!7544 (toList!3787 List!8710)) )
))
(declare-fun lt!212696 () ListLongMap!7543)

(declare-fun lt!212698 () tuple2!8630)

(declare-fun minValueBefore!38 () V!18475)

(declare-fun +!1695 (ListLongMap!7543 tuple2!8630) ListLongMap!7543)

(assert (=> b!469422 (= (+!1695 lt!212696 lt!212698) (+!1695 (+!1695 lt!212696 (tuple2!8631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212698))))

(declare-fun minValueAfter!38 () V!18475)

(assert (=> b!469422 (= lt!212698 (tuple2!8631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13731 0))(
  ( (Unit!13732) )
))
(declare-fun lt!212699 () Unit!13731)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!108 (ListLongMap!7543 (_ BitVec 64) V!18475 V!18475) Unit!13731)

(assert (=> b!469422 (= lt!212699 (addSameAsAddTwiceSameKeyDiffValues!108 lt!212696 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212694 () ListLongMap!7543)

(declare-fun zeroValue!794 () V!18475)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMap!2209 (array!29827 array!29829 (_ BitVec 32) (_ BitVec 32) V!18475 V!18475 (_ BitVec 32) Int) ListLongMap!7543)

(assert (=> b!469422 (= lt!212694 (getCurrentListMap!2209 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212697 () ListLongMap!7543)

(assert (=> b!469422 (= lt!212697 (getCurrentListMap!2209 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469423 () Bool)

(assert (=> b!469423 (= e!274866 (not e!274869))))

(declare-fun res!280512 () Bool)

(assert (=> b!469423 (=> res!280512 e!274869)))

(assert (=> b!469423 (= res!280512 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212693 () ListLongMap!7543)

(assert (=> b!469423 (= lt!212696 lt!212693)))

(declare-fun lt!212695 () Unit!13731)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!135 (array!29827 array!29829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18475 V!18475 V!18475 V!18475 (_ BitVec 32) Int) Unit!13731)

(assert (=> b!469423 (= lt!212695 (lemmaNoChangeToArrayThenSameMapNoExtras!135 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1955 (array!29827 array!29829 (_ BitVec 32) (_ BitVec 32) V!18475 V!18475 (_ BitVec 32) Int) ListLongMap!7543)

(assert (=> b!469423 (= lt!212693 (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469423 (= lt!212696 (getCurrentListMapNoExtraKeys!1955 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469424 () Bool)

(declare-fun e!274867 () Bool)

(declare-fun tp_is_empty!13027 () Bool)

(assert (=> b!469424 (= e!274867 tp_is_empty!13027)))

(declare-fun b!469425 () Bool)

(declare-fun res!280515 () Bool)

(assert (=> b!469425 (=> (not res!280515) (not e!274866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29827 (_ BitVec 32)) Bool)

(assert (=> b!469425 (= res!280515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469426 () Bool)

(declare-fun e!274864 () Bool)

(assert (=> b!469426 (= e!274864 (and e!274867 mapRes!21238))))

(declare-fun condMapEmpty!21238 () Bool)

(declare-fun mapDefault!21238 () ValueCell!6170)

