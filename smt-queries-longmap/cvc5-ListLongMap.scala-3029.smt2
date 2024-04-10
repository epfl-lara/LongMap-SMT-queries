; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42548 () Bool)

(assert start!42548)

(declare-fun b_free!11983 () Bool)

(declare-fun b_next!11983 () Bool)

(assert (=> start!42548 (= b_free!11983 (not b_next!11983))))

(declare-fun tp!41989 () Bool)

(declare-fun b_and!20463 () Bool)

(assert (=> start!42548 (= tp!41989 b_and!20463)))

(declare-fun b!474710 () Bool)

(declare-fun e!278657 () Bool)

(assert (=> b!474710 (= e!278657 false)))

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30569 0))(
  ( (array!30570 (arr!14702 (Array (_ BitVec 32) (_ BitVec 64))) (size!15054 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30569)

(declare-datatypes ((V!18987 0))(
  ( (V!18988 (val!6750 Int)) )
))
(declare-datatypes ((ValueCell!6362 0))(
  ( (ValueCellFull!6362 (v!9043 V!18987)) (EmptyCell!6362) )
))
(declare-datatypes ((array!30571 0))(
  ( (array!30572 (arr!14703 (Array (_ BitVec 32) ValueCell!6362)) (size!15055 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30571)

(declare-fun zeroValue!794 () V!18987)

(declare-datatypes ((tuple2!8904 0))(
  ( (tuple2!8905 (_1!4463 (_ BitVec 64)) (_2!4463 V!18987)) )
))
(declare-datatypes ((List!8979 0))(
  ( (Nil!8976) (Cons!8975 (h!9831 tuple2!8904) (t!14953 List!8979)) )
))
(declare-datatypes ((ListLongMap!7817 0))(
  ( (ListLongMap!7818 (toList!3924 List!8979)) )
))
(declare-fun lt!216268 () ListLongMap!7817)

(declare-fun minValueAfter!38 () V!18987)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2081 (array!30569 array!30571 (_ BitVec 32) (_ BitVec 32) V!18987 V!18987 (_ BitVec 32) Int) ListLongMap!7817)

(assert (=> b!474710 (= lt!216268 (getCurrentListMapNoExtraKeys!2081 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18987)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!216269 () ListLongMap!7817)

(assert (=> b!474710 (= lt!216269 (getCurrentListMapNoExtraKeys!2081 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474711 () Bool)

(declare-fun e!278655 () Bool)

(declare-fun tp_is_empty!13411 () Bool)

(assert (=> b!474711 (= e!278655 tp_is_empty!13411)))

(declare-fun b!474712 () Bool)

(declare-fun res!283515 () Bool)

(assert (=> b!474712 (=> (not res!283515) (not e!278657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30569 (_ BitVec 32)) Bool)

(assert (=> b!474712 (= res!283515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474713 () Bool)

(declare-fun res!283517 () Bool)

(assert (=> b!474713 (=> (not res!283517) (not e!278657))))

(assert (=> b!474713 (= res!283517 (and (= (size!15055 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15054 _keys!1025) (size!15055 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474715 () Bool)

(declare-fun res!283516 () Bool)

(assert (=> b!474715 (=> (not res!283516) (not e!278657))))

(declare-datatypes ((List!8980 0))(
  ( (Nil!8977) (Cons!8976 (h!9832 (_ BitVec 64)) (t!14954 List!8980)) )
))
(declare-fun arrayNoDuplicates!0 (array!30569 (_ BitVec 32) List!8980) Bool)

(assert (=> b!474715 (= res!283516 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8977))))

(declare-fun mapIsEmpty!21835 () Bool)

(declare-fun mapRes!21835 () Bool)

(assert (=> mapIsEmpty!21835 mapRes!21835))

(declare-fun mapNonEmpty!21835 () Bool)

(declare-fun tp!41988 () Bool)

(declare-fun e!278654 () Bool)

(assert (=> mapNonEmpty!21835 (= mapRes!21835 (and tp!41988 e!278654))))

(declare-fun mapValue!21835 () ValueCell!6362)

(declare-fun mapKey!21835 () (_ BitVec 32))

(declare-fun mapRest!21835 () (Array (_ BitVec 32) ValueCell!6362))

(assert (=> mapNonEmpty!21835 (= (arr!14703 _values!833) (store mapRest!21835 mapKey!21835 mapValue!21835))))

(declare-fun b!474716 () Bool)

(declare-fun e!278658 () Bool)

(assert (=> b!474716 (= e!278658 (and e!278655 mapRes!21835))))

(declare-fun condMapEmpty!21835 () Bool)

(declare-fun mapDefault!21835 () ValueCell!6362)

