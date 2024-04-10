; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20362 () Bool)

(assert start!20362)

(declare-fun b_free!5021 () Bool)

(declare-fun b_next!5021 () Bool)

(assert (=> start!20362 (= b_free!5021 (not b_next!5021))))

(declare-fun tp!18095 () Bool)

(declare-fun b_and!11767 () Bool)

(assert (=> start!20362 (= tp!18095 b_and!11767)))

(declare-fun b!201006 () Bool)

(declare-fun e!131772 () Bool)

(declare-fun e!131768 () Bool)

(assert (=> b!201006 (= e!131772 (not e!131768))))

(declare-fun res!95935 () Bool)

(assert (=> b!201006 (=> res!95935 e!131768)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201006 (= res!95935 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6149 0))(
  ( (V!6150 (val!2483 Int)) )
))
(declare-datatypes ((ValueCell!2095 0))(
  ( (ValueCellFull!2095 (v!4453 V!6149)) (EmptyCell!2095) )
))
(declare-datatypes ((array!8983 0))(
  ( (array!8984 (arr!4242 (Array (_ BitVec 32) ValueCell!2095)) (size!4567 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8983)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3756 0))(
  ( (tuple2!3757 (_1!1889 (_ BitVec 64)) (_2!1889 V!6149)) )
))
(declare-datatypes ((List!2672 0))(
  ( (Nil!2669) (Cons!2668 (h!3310 tuple2!3756) (t!7603 List!2672)) )
))
(declare-datatypes ((ListLongMap!2669 0))(
  ( (ListLongMap!2670 (toList!1350 List!2672)) )
))
(declare-fun lt!99801 () ListLongMap!2669)

(declare-fun zeroValue!615 () V!6149)

(declare-datatypes ((array!8985 0))(
  ( (array!8986 (arr!4243 (Array (_ BitVec 32) (_ BitVec 64))) (size!4568 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8985)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6149)

(declare-fun getCurrentListMap!939 (array!8985 array!8983 (_ BitVec 32) (_ BitVec 32) V!6149 V!6149 (_ BitVec 32) Int) ListLongMap!2669)

(assert (=> b!201006 (= lt!99801 (getCurrentListMap!939 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99804 () array!8983)

(declare-fun lt!99799 () ListLongMap!2669)

(assert (=> b!201006 (= lt!99799 (getCurrentListMap!939 _keys!825 lt!99804 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99798 () ListLongMap!2669)

(declare-fun lt!99800 () ListLongMap!2669)

(assert (=> b!201006 (and (= lt!99798 lt!99800) (= lt!99800 lt!99798))))

(declare-fun lt!99793 () ListLongMap!2669)

(declare-fun lt!99807 () tuple2!3756)

(declare-fun +!377 (ListLongMap!2669 tuple2!3756) ListLongMap!2669)

(assert (=> b!201006 (= lt!99800 (+!377 lt!99793 lt!99807))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6149)

(assert (=> b!201006 (= lt!99807 (tuple2!3757 k!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6054 0))(
  ( (Unit!6055) )
))
(declare-fun lt!99796 () Unit!6054)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!52 (array!8985 array!8983 (_ BitVec 32) (_ BitVec 32) V!6149 V!6149 (_ BitVec 32) (_ BitVec 64) V!6149 (_ BitVec 32) Int) Unit!6054)

(assert (=> b!201006 (= lt!99796 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!52 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!313 (array!8985 array!8983 (_ BitVec 32) (_ BitVec 32) V!6149 V!6149 (_ BitVec 32) Int) ListLongMap!2669)

(assert (=> b!201006 (= lt!99798 (getCurrentListMapNoExtraKeys!313 _keys!825 lt!99804 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201006 (= lt!99804 (array!8984 (store (arr!4242 _values!649) i!601 (ValueCellFull!2095 v!520)) (size!4567 _values!649)))))

(assert (=> b!201006 (= lt!99793 (getCurrentListMapNoExtraKeys!313 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201007 () Bool)

(declare-fun e!131771 () Bool)

(assert (=> b!201007 (= e!131771 true)))

(declare-fun lt!99792 () ListLongMap!2669)

(declare-fun lt!99794 () tuple2!3756)

(declare-fun lt!99802 () ListLongMap!2669)

(assert (=> b!201007 (= (+!377 lt!99802 lt!99794) (+!377 lt!99792 lt!99807))))

(declare-fun lt!99806 () Unit!6054)

(declare-fun lt!99795 () ListLongMap!2669)

(declare-fun addCommutativeForDiffKeys!98 (ListLongMap!2669 (_ BitVec 64) V!6149 (_ BitVec 64) V!6149) Unit!6054)

(assert (=> b!201007 (= lt!99806 (addCommutativeForDiffKeys!98 lt!99795 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201008 () Bool)

(declare-fun res!95929 () Bool)

(assert (=> b!201008 (=> (not res!95929) (not e!131772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201008 (= res!95929 (validKeyInArray!0 k!843))))

(declare-fun b!201009 () Bool)

(declare-fun e!131770 () Bool)

(declare-fun tp_is_empty!4877 () Bool)

(assert (=> b!201009 (= e!131770 tp_is_empty!4877)))

(declare-fun b!201011 () Bool)

(declare-fun e!131773 () Bool)

(assert (=> b!201011 (= e!131773 tp_is_empty!4877)))

(declare-fun b!201012 () Bool)

(declare-fun res!95928 () Bool)

(assert (=> b!201012 (=> (not res!95928) (not e!131772))))

(assert (=> b!201012 (= res!95928 (= (select (arr!4243 _keys!825) i!601) k!843))))

(declare-fun mapNonEmpty!8384 () Bool)

(declare-fun mapRes!8384 () Bool)

(declare-fun tp!18094 () Bool)

(assert (=> mapNonEmpty!8384 (= mapRes!8384 (and tp!18094 e!131770))))

(declare-fun mapValue!8384 () ValueCell!2095)

(declare-fun mapKey!8384 () (_ BitVec 32))

(declare-fun mapRest!8384 () (Array (_ BitVec 32) ValueCell!2095))

(assert (=> mapNonEmpty!8384 (= (arr!4242 _values!649) (store mapRest!8384 mapKey!8384 mapValue!8384))))

(declare-fun b!201013 () Bool)

(declare-fun res!95930 () Bool)

(assert (=> b!201013 (=> (not res!95930) (not e!131772))))

(declare-datatypes ((List!2673 0))(
  ( (Nil!2670) (Cons!2669 (h!3311 (_ BitVec 64)) (t!7604 List!2673)) )
))
(declare-fun arrayNoDuplicates!0 (array!8985 (_ BitVec 32) List!2673) Bool)

(assert (=> b!201013 (= res!95930 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2670))))

(declare-fun mapIsEmpty!8384 () Bool)

(assert (=> mapIsEmpty!8384 mapRes!8384))

(declare-fun b!201014 () Bool)

(declare-fun res!95934 () Bool)

(assert (=> b!201014 (=> (not res!95934) (not e!131772))))

(assert (=> b!201014 (= res!95934 (and (= (size!4567 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4568 _keys!825) (size!4567 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201015 () Bool)

(assert (=> b!201015 (= e!131768 e!131771)))

(declare-fun res!95933 () Bool)

(assert (=> b!201015 (=> res!95933 e!131771)))

(assert (=> b!201015 (= res!95933 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99803 () ListLongMap!2669)

(assert (=> b!201015 (= lt!99803 lt!99802)))

(assert (=> b!201015 (= lt!99802 (+!377 lt!99795 lt!99807))))

(declare-fun lt!99805 () Unit!6054)

(assert (=> b!201015 (= lt!99805 (addCommutativeForDiffKeys!98 lt!99793 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!201015 (= lt!99799 (+!377 lt!99803 lt!99794))))

(declare-fun lt!99797 () tuple2!3756)

(assert (=> b!201015 (= lt!99803 (+!377 lt!99800 lt!99797))))

(assert (=> b!201015 (= lt!99801 lt!99792)))

(assert (=> b!201015 (= lt!99792 (+!377 lt!99795 lt!99794))))

(assert (=> b!201015 (= lt!99795 (+!377 lt!99793 lt!99797))))

(assert (=> b!201015 (= lt!99799 (+!377 (+!377 lt!99798 lt!99797) lt!99794))))

(assert (=> b!201015 (= lt!99794 (tuple2!3757 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201015 (= lt!99797 (tuple2!3757 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!95927 () Bool)

(assert (=> start!20362 (=> (not res!95927) (not e!131772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20362 (= res!95927 (validMask!0 mask!1149))))

(assert (=> start!20362 e!131772))

(declare-fun e!131769 () Bool)

(declare-fun array_inv!2791 (array!8983) Bool)

(assert (=> start!20362 (and (array_inv!2791 _values!649) e!131769)))

(assert (=> start!20362 true))

(assert (=> start!20362 tp_is_empty!4877))

(declare-fun array_inv!2792 (array!8985) Bool)

(assert (=> start!20362 (array_inv!2792 _keys!825)))

(assert (=> start!20362 tp!18095))

(declare-fun b!201010 () Bool)

(declare-fun res!95931 () Bool)

(assert (=> b!201010 (=> (not res!95931) (not e!131772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8985 (_ BitVec 32)) Bool)

(assert (=> b!201010 (= res!95931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201016 () Bool)

(assert (=> b!201016 (= e!131769 (and e!131773 mapRes!8384))))

(declare-fun condMapEmpty!8384 () Bool)

(declare-fun mapDefault!8384 () ValueCell!2095)

