; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71182 () Bool)

(assert start!71182)

(declare-fun b_free!13349 () Bool)

(declare-fun b_next!13349 () Bool)

(assert (=> start!71182 (= b_free!13349 (not b_next!13349))))

(declare-fun tp!46807 () Bool)

(declare-fun b_and!22275 () Bool)

(assert (=> start!71182 (= tp!46807 b_and!22275)))

(declare-datatypes ((V!25079 0))(
  ( (V!25080 (val!7577 Int)) )
))
(declare-datatypes ((tuple2!10044 0))(
  ( (tuple2!10045 (_1!5033 (_ BitVec 64)) (_2!5033 V!25079)) )
))
(declare-fun lt!374616 () tuple2!10044)

(declare-datatypes ((List!15841 0))(
  ( (Nil!15838) (Cons!15837 (h!16966 tuple2!10044) (t!22188 List!15841)) )
))
(declare-datatypes ((ListLongMap!8867 0))(
  ( (ListLongMap!8868 (toList!4449 List!15841)) )
))
(declare-fun lt!374607 () ListLongMap!8867)

(declare-fun b!826912 () Bool)

(declare-fun zeroValueAfter!34 () V!25079)

(declare-fun lt!374617 () ListLongMap!8867)

(declare-fun e!460588 () Bool)

(declare-fun +!1956 (ListLongMap!8867 tuple2!10044) ListLongMap!8867)

(assert (=> b!826912 (= e!460588 (= lt!374617 (+!1956 (+!1956 lt!374607 (tuple2!10045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374616)))))

(declare-fun b!826913 () Bool)

(declare-fun e!460584 () Bool)

(declare-fun tp_is_empty!15059 () Bool)

(assert (=> b!826913 (= e!460584 tp_is_empty!15059)))

(declare-fun b!826914 () Bool)

(declare-fun res!563695 () Bool)

(declare-fun e!460581 () Bool)

(assert (=> b!826914 (=> (not res!563695) (not e!460581))))

(declare-datatypes ((array!46294 0))(
  ( (array!46295 (arr!22192 (Array (_ BitVec 32) (_ BitVec 64))) (size!22613 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46294)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46294 (_ BitVec 32)) Bool)

(assert (=> b!826914 (= res!563695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826915 () Bool)

(declare-fun e!460583 () Bool)

(assert (=> b!826915 (= e!460583 (bvsle #b00000000000000000000000000000000 (size!22613 _keys!976)))))

(declare-fun res!563692 () Bool)

(assert (=> start!71182 (=> (not res!563692) (not e!460581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71182 (= res!563692 (validMask!0 mask!1312))))

(assert (=> start!71182 e!460581))

(assert (=> start!71182 tp_is_empty!15059))

(declare-fun array_inv!17687 (array!46294) Bool)

(assert (=> start!71182 (array_inv!17687 _keys!976)))

(assert (=> start!71182 true))

(declare-datatypes ((ValueCell!7114 0))(
  ( (ValueCellFull!7114 (v!10011 V!25079)) (EmptyCell!7114) )
))
(declare-datatypes ((array!46296 0))(
  ( (array!46297 (arr!22193 (Array (_ BitVec 32) ValueCell!7114)) (size!22614 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46296)

(declare-fun e!460587 () Bool)

(declare-fun array_inv!17688 (array!46296) Bool)

(assert (=> start!71182 (and (array_inv!17688 _values!788) e!460587)))

(assert (=> start!71182 tp!46807))

(declare-fun b!826916 () Bool)

(declare-fun res!563696 () Bool)

(assert (=> b!826916 (=> (not res!563696) (not e!460581))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!826916 (= res!563696 (and (= (size!22614 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22613 _keys!976) (size!22614 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826917 () Bool)

(declare-fun e!460586 () Bool)

(assert (=> b!826917 (= e!460586 e!460583)))

(declare-fun res!563694 () Bool)

(assert (=> b!826917 (=> res!563694 e!460583)))

(declare-fun lt!374606 () tuple2!10044)

(declare-fun lt!374613 () ListLongMap!8867)

(assert (=> b!826917 (= res!563694 (not (= lt!374617 (+!1956 (+!1956 lt!374613 lt!374606) lt!374616))))))

(declare-fun lt!374605 () ListLongMap!8867)

(declare-fun lt!374608 () ListLongMap!8867)

(assert (=> b!826917 (and (= lt!374605 lt!374608) (= lt!374617 lt!374608) (= lt!374617 lt!374605))))

(declare-fun lt!374615 () ListLongMap!8867)

(assert (=> b!826917 (= lt!374608 (+!1956 lt!374615 lt!374606))))

(declare-fun lt!374609 () ListLongMap!8867)

(assert (=> b!826917 (= lt!374605 (+!1956 lt!374609 lt!374606))))

(declare-fun zeroValueBefore!34 () V!25079)

(declare-datatypes ((Unit!28355 0))(
  ( (Unit!28356) )
))
(declare-fun lt!374612 () Unit!28355)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!236 (ListLongMap!8867 (_ BitVec 64) V!25079 V!25079) Unit!28355)

(assert (=> b!826917 (= lt!374612 (addSameAsAddTwiceSameKeyDiffValues!236 lt!374609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460585 () Bool)

(assert (=> b!826917 e!460585))

(declare-fun res!563690 () Bool)

(assert (=> b!826917 (=> (not res!563690) (not e!460585))))

(declare-fun lt!374610 () ListLongMap!8867)

(assert (=> b!826917 (= res!563690 (= lt!374610 lt!374615))))

(declare-fun lt!374611 () tuple2!10044)

(assert (=> b!826917 (= lt!374615 (+!1956 lt!374609 lt!374611))))

(assert (=> b!826917 (= lt!374609 (+!1956 lt!374613 lt!374616))))

(assert (=> b!826917 (= lt!374606 (tuple2!10045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!826917 e!460588))

(declare-fun res!563697 () Bool)

(assert (=> b!826917 (=> (not res!563697) (not e!460588))))

(assert (=> b!826917 (= res!563697 (= lt!374610 (+!1956 (+!1956 lt!374613 lt!374611) lt!374616)))))

(declare-fun minValue!754 () V!25079)

(assert (=> b!826917 (= lt!374616 (tuple2!10045 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826917 (= lt!374611 (tuple2!10045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2576 (array!46294 array!46296 (_ BitVec 32) (_ BitVec 32) V!25079 V!25079 (_ BitVec 32) Int) ListLongMap!8867)

(assert (=> b!826917 (= lt!374617 (getCurrentListMap!2576 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826917 (= lt!374610 (getCurrentListMap!2576 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826918 () Bool)

(declare-fun e!460580 () Bool)

(assert (=> b!826918 (= e!460580 tp_is_empty!15059)))

(declare-fun mapIsEmpty!24214 () Bool)

(declare-fun mapRes!24214 () Bool)

(assert (=> mapIsEmpty!24214 mapRes!24214))

(declare-fun b!826919 () Bool)

(assert (=> b!826919 (= e!460585 (= lt!374617 (+!1956 (+!1956 lt!374607 lt!374616) lt!374606)))))

(declare-fun b!826920 () Bool)

(assert (=> b!826920 (= e!460587 (and e!460580 mapRes!24214))))

(declare-fun condMapEmpty!24214 () Bool)

(declare-fun mapDefault!24214 () ValueCell!7114)

