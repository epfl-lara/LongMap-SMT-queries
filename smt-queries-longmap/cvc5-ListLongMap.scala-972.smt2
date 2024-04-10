; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21050 () Bool)

(assert start!21050)

(declare-fun b_free!5581 () Bool)

(declare-fun b_next!5581 () Bool)

(assert (=> start!21050 (= b_free!5581 (not b_next!5581))))

(declare-fun tp!19801 () Bool)

(declare-fun b_and!12399 () Bool)

(assert (=> start!21050 (= tp!19801 b_and!12399)))

(declare-fun res!103408 () Bool)

(declare-fun e!137773 () Bool)

(assert (=> start!21050 (=> (not res!103408) (not e!137773))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21050 (= res!103408 (validMask!0 mask!1149))))

(assert (=> start!21050 e!137773))

(declare-datatypes ((V!6905 0))(
  ( (V!6906 (val!2766 Int)) )
))
(declare-datatypes ((ValueCell!2378 0))(
  ( (ValueCellFull!2378 (v!4760 V!6905)) (EmptyCell!2378) )
))
(declare-datatypes ((array!10087 0))(
  ( (array!10088 (arr!4788 (Array (_ BitVec 32) ValueCell!2378)) (size!5113 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10087)

(declare-fun e!137777 () Bool)

(declare-fun array_inv!3169 (array!10087) Bool)

(assert (=> start!21050 (and (array_inv!3169 _values!649) e!137777)))

(assert (=> start!21050 true))

(declare-fun tp_is_empty!5443 () Bool)

(assert (=> start!21050 tp_is_empty!5443))

(declare-datatypes ((array!10089 0))(
  ( (array!10090 (arr!4789 (Array (_ BitVec 32) (_ BitVec 64))) (size!5114 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10089)

(declare-fun array_inv!3170 (array!10089) Bool)

(assert (=> start!21050 (array_inv!3170 _keys!825)))

(assert (=> start!21050 tp!19801))

(declare-fun b!211678 () Bool)

(declare-fun res!103413 () Bool)

(assert (=> b!211678 (=> (not res!103413) (not e!137773))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!211678 (= res!103413 (and (= (size!5113 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5114 _keys!825) (size!5113 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!4184 0))(
  ( (tuple2!4185 (_1!2103 (_ BitVec 64)) (_2!2103 V!6905)) )
))
(declare-datatypes ((List!3074 0))(
  ( (Nil!3071) (Cons!3070 (h!3712 tuple2!4184) (t!8017 List!3074)) )
))
(declare-datatypes ((ListLongMap!3097 0))(
  ( (ListLongMap!3098 (toList!1564 List!3074)) )
))
(declare-fun lt!108893 () ListLongMap!3097)

(declare-fun lt!108895 () tuple2!4184)

(declare-fun lt!108897 () ListLongMap!3097)

(declare-fun b!211679 () Bool)

(declare-fun e!137772 () Bool)

(declare-fun +!567 (ListLongMap!3097 tuple2!4184) ListLongMap!3097)

(assert (=> b!211679 (= e!137772 (= lt!108893 (+!567 lt!108897 lt!108895)))))

(declare-fun b!211680 () Bool)

(declare-fun e!137778 () Bool)

(assert (=> b!211680 (= e!137778 tp_is_empty!5443)))

(declare-fun b!211681 () Bool)

(declare-fun e!137774 () Bool)

(assert (=> b!211681 (= e!137774 tp_is_empty!5443)))

(declare-fun b!211682 () Bool)

(declare-fun res!103405 () Bool)

(assert (=> b!211682 (=> (not res!103405) (not e!137773))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!211682 (= res!103405 (= (select (arr!4789 _keys!825) i!601) k!843))))

(declare-fun mapIsEmpty!9251 () Bool)

(declare-fun mapRes!9251 () Bool)

(assert (=> mapIsEmpty!9251 mapRes!9251))

(declare-fun b!211683 () Bool)

(declare-fun res!103410 () Bool)

(assert (=> b!211683 (=> (not res!103410) (not e!137773))))

(declare-datatypes ((List!3075 0))(
  ( (Nil!3072) (Cons!3071 (h!3713 (_ BitVec 64)) (t!8018 List!3075)) )
))
(declare-fun arrayNoDuplicates!0 (array!10089 (_ BitVec 32) List!3075) Bool)

(assert (=> b!211683 (= res!103410 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3072))))

(declare-fun b!211684 () Bool)

(declare-fun e!137776 () Bool)

(assert (=> b!211684 (= e!137776 (not (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211684 e!137772))

(declare-fun res!103406 () Bool)

(assert (=> b!211684 (=> (not res!103406) (not e!137772))))

(declare-fun lt!108896 () ListLongMap!3097)

(assert (=> b!211684 (= res!103406 (= lt!108893 (+!567 lt!108896 lt!108895)))))

(declare-fun zeroValue!615 () V!6905)

(assert (=> b!211684 (= lt!108895 (tuple2!4185 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!211685 () Bool)

(assert (=> b!211685 (= e!137773 (not e!137776))))

(declare-fun res!103411 () Bool)

(assert (=> b!211685 (=> res!103411 e!137776)))

(assert (=> b!211685 (= res!103411 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6905)

(declare-fun lt!108898 () ListLongMap!3097)

(declare-fun getCurrentListMap!1097 (array!10089 array!10087 (_ BitVec 32) (_ BitVec 32) V!6905 V!6905 (_ BitVec 32) Int) ListLongMap!3097)

(assert (=> b!211685 (= lt!108898 (getCurrentListMap!1097 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108891 () array!10087)

(assert (=> b!211685 (= lt!108893 (getCurrentListMap!1097 _keys!825 lt!108891 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211685 (and (= lt!108896 lt!108897) (= lt!108897 lt!108896))))

(declare-fun lt!108892 () ListLongMap!3097)

(declare-fun v!520 () V!6905)

(assert (=> b!211685 (= lt!108897 (+!567 lt!108892 (tuple2!4185 k!843 v!520)))))

(declare-datatypes ((Unit!6426 0))(
  ( (Unit!6427) )
))
(declare-fun lt!108894 () Unit!6426)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!214 (array!10089 array!10087 (_ BitVec 32) (_ BitVec 32) V!6905 V!6905 (_ BitVec 32) (_ BitVec 64) V!6905 (_ BitVec 32) Int) Unit!6426)

(assert (=> b!211685 (= lt!108894 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!214 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!499 (array!10089 array!10087 (_ BitVec 32) (_ BitVec 32) V!6905 V!6905 (_ BitVec 32) Int) ListLongMap!3097)

(assert (=> b!211685 (= lt!108896 (getCurrentListMapNoExtraKeys!499 _keys!825 lt!108891 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211685 (= lt!108891 (array!10088 (store (arr!4788 _values!649) i!601 (ValueCellFull!2378 v!520)) (size!5113 _values!649)))))

(assert (=> b!211685 (= lt!108892 (getCurrentListMapNoExtraKeys!499 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211686 () Bool)

(declare-fun res!103404 () Bool)

(assert (=> b!211686 (=> (not res!103404) (not e!137773))))

(assert (=> b!211686 (= res!103404 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5114 _keys!825))))))

(declare-fun b!211687 () Bool)

(declare-fun res!103409 () Bool)

(assert (=> b!211687 (=> (not res!103409) (not e!137773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211687 (= res!103409 (validKeyInArray!0 k!843))))

(declare-fun b!211688 () Bool)

(declare-fun res!103407 () Bool)

(assert (=> b!211688 (=> (not res!103407) (not e!137772))))

(assert (=> b!211688 (= res!103407 (= lt!108898 (+!567 lt!108892 lt!108895)))))

(declare-fun mapNonEmpty!9251 () Bool)

(declare-fun tp!19802 () Bool)

(assert (=> mapNonEmpty!9251 (= mapRes!9251 (and tp!19802 e!137778))))

(declare-fun mapKey!9251 () (_ BitVec 32))

(declare-fun mapValue!9251 () ValueCell!2378)

(declare-fun mapRest!9251 () (Array (_ BitVec 32) ValueCell!2378))

(assert (=> mapNonEmpty!9251 (= (arr!4788 _values!649) (store mapRest!9251 mapKey!9251 mapValue!9251))))

(declare-fun b!211689 () Bool)

(declare-fun res!103412 () Bool)

(assert (=> b!211689 (=> (not res!103412) (not e!137773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10089 (_ BitVec 32)) Bool)

(assert (=> b!211689 (= res!103412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!211690 () Bool)

(assert (=> b!211690 (= e!137777 (and e!137774 mapRes!9251))))

(declare-fun condMapEmpty!9251 () Bool)

(declare-fun mapDefault!9251 () ValueCell!2378)

