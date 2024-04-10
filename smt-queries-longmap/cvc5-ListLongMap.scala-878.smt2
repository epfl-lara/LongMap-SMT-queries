; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20364 () Bool)

(assert start!20364)

(declare-fun b_free!5023 () Bool)

(declare-fun b_next!5023 () Bool)

(assert (=> start!20364 (= b_free!5023 (not b_next!5023))))

(declare-fun tp!18100 () Bool)

(declare-fun b_and!11769 () Bool)

(assert (=> start!20364 (= tp!18100 b_and!11769)))

(declare-fun b!201042 () Bool)

(declare-fun res!95961 () Bool)

(declare-fun e!131793 () Bool)

(assert (=> b!201042 (=> (not res!95961) (not e!131793))))

(declare-datatypes ((array!8987 0))(
  ( (array!8988 (arr!4244 (Array (_ BitVec 32) (_ BitVec 64))) (size!4569 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8987)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201042 (= res!95961 (= (select (arr!4244 _keys!825) i!601) k!843))))

(declare-fun b!201043 () Bool)

(declare-fun res!95955 () Bool)

(assert (=> b!201043 (=> (not res!95955) (not e!131793))))

(declare-datatypes ((V!6153 0))(
  ( (V!6154 (val!2484 Int)) )
))
(declare-datatypes ((ValueCell!2096 0))(
  ( (ValueCellFull!2096 (v!4454 V!6153)) (EmptyCell!2096) )
))
(declare-datatypes ((array!8989 0))(
  ( (array!8990 (arr!4245 (Array (_ BitVec 32) ValueCell!2096)) (size!4570 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8989)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201043 (= res!95955 (and (= (size!4570 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4569 _keys!825) (size!4570 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201044 () Bool)

(declare-fun res!95959 () Bool)

(assert (=> b!201044 (=> (not res!95959) (not e!131793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201044 (= res!95959 (validKeyInArray!0 k!843))))

(declare-fun b!201045 () Bool)

(declare-fun e!131795 () Bool)

(assert (=> b!201045 (= e!131793 (not e!131795))))

(declare-fun res!95957 () Bool)

(assert (=> b!201045 (=> res!95957 e!131795)))

(assert (=> b!201045 (= res!95957 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3758 0))(
  ( (tuple2!3759 (_1!1890 (_ BitVec 64)) (_2!1890 V!6153)) )
))
(declare-datatypes ((List!2674 0))(
  ( (Nil!2671) (Cons!2670 (h!3312 tuple2!3758) (t!7605 List!2674)) )
))
(declare-datatypes ((ListLongMap!2671 0))(
  ( (ListLongMap!2672 (toList!1351 List!2674)) )
))
(declare-fun lt!99852 () ListLongMap!2671)

(declare-fun zeroValue!615 () V!6153)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6153)

(declare-fun getCurrentListMap!940 (array!8987 array!8989 (_ BitVec 32) (_ BitVec 32) V!6153 V!6153 (_ BitVec 32) Int) ListLongMap!2671)

(assert (=> b!201045 (= lt!99852 (getCurrentListMap!940 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99845 () array!8989)

(declare-fun lt!99840 () ListLongMap!2671)

(assert (=> b!201045 (= lt!99840 (getCurrentListMap!940 _keys!825 lt!99845 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99853 () ListLongMap!2671)

(declare-fun lt!99844 () ListLongMap!2671)

(assert (=> b!201045 (and (= lt!99853 lt!99844) (= lt!99844 lt!99853))))

(declare-fun lt!99855 () ListLongMap!2671)

(declare-fun lt!99841 () tuple2!3758)

(declare-fun +!378 (ListLongMap!2671 tuple2!3758) ListLongMap!2671)

(assert (=> b!201045 (= lt!99844 (+!378 lt!99855 lt!99841))))

(declare-fun v!520 () V!6153)

(assert (=> b!201045 (= lt!99841 (tuple2!3759 k!843 v!520))))

(declare-datatypes ((Unit!6056 0))(
  ( (Unit!6057) )
))
(declare-fun lt!99847 () Unit!6056)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!53 (array!8987 array!8989 (_ BitVec 32) (_ BitVec 32) V!6153 V!6153 (_ BitVec 32) (_ BitVec 64) V!6153 (_ BitVec 32) Int) Unit!6056)

(assert (=> b!201045 (= lt!99847 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!53 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!314 (array!8987 array!8989 (_ BitVec 32) (_ BitVec 32) V!6153 V!6153 (_ BitVec 32) Int) ListLongMap!2671)

(assert (=> b!201045 (= lt!99853 (getCurrentListMapNoExtraKeys!314 _keys!825 lt!99845 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201045 (= lt!99845 (array!8990 (store (arr!4245 _values!649) i!601 (ValueCellFull!2096 v!520)) (size!4570 _values!649)))))

(assert (=> b!201045 (= lt!99855 (getCurrentListMapNoExtraKeys!314 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!95956 () Bool)

(assert (=> start!20364 (=> (not res!95956) (not e!131793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20364 (= res!95956 (validMask!0 mask!1149))))

(assert (=> start!20364 e!131793))

(declare-fun e!131790 () Bool)

(declare-fun array_inv!2793 (array!8989) Bool)

(assert (=> start!20364 (and (array_inv!2793 _values!649) e!131790)))

(assert (=> start!20364 true))

(declare-fun tp_is_empty!4879 () Bool)

(assert (=> start!20364 tp_is_empty!4879))

(declare-fun array_inv!2794 (array!8987) Bool)

(assert (=> start!20364 (array_inv!2794 _keys!825)))

(assert (=> start!20364 tp!18100))

(declare-fun b!201046 () Bool)

(declare-fun res!95960 () Bool)

(assert (=> b!201046 (=> (not res!95960) (not e!131793))))

(declare-datatypes ((List!2675 0))(
  ( (Nil!2672) (Cons!2671 (h!3313 (_ BitVec 64)) (t!7606 List!2675)) )
))
(declare-fun arrayNoDuplicates!0 (array!8987 (_ BitVec 32) List!2675) Bool)

(assert (=> b!201046 (= res!95960 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2672))))

(declare-fun b!201047 () Bool)

(declare-fun e!131791 () Bool)

(assert (=> b!201047 (= e!131791 true)))

(declare-fun lt!99850 () tuple2!3758)

(declare-fun lt!99854 () ListLongMap!2671)

(declare-fun lt!99849 () ListLongMap!2671)

(assert (=> b!201047 (= (+!378 lt!99854 lt!99850) (+!378 lt!99849 lt!99841))))

(declare-fun lt!99843 () ListLongMap!2671)

(declare-fun lt!99842 () Unit!6056)

(declare-fun addCommutativeForDiffKeys!99 (ListLongMap!2671 (_ BitVec 64) V!6153 (_ BitVec 64) V!6153) Unit!6056)

(assert (=> b!201047 (= lt!99842 (addCommutativeForDiffKeys!99 lt!99843 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8387 () Bool)

(declare-fun mapRes!8387 () Bool)

(assert (=> mapIsEmpty!8387 mapRes!8387))

(declare-fun b!201048 () Bool)

(declare-fun res!95954 () Bool)

(assert (=> b!201048 (=> (not res!95954) (not e!131793))))

(assert (=> b!201048 (= res!95954 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4569 _keys!825))))))

(declare-fun b!201049 () Bool)

(declare-fun res!95962 () Bool)

(assert (=> b!201049 (=> (not res!95962) (not e!131793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8987 (_ BitVec 32)) Bool)

(assert (=> b!201049 (= res!95962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201050 () Bool)

(assert (=> b!201050 (= e!131795 e!131791)))

(declare-fun res!95958 () Bool)

(assert (=> b!201050 (=> res!95958 e!131791)))

(assert (=> b!201050 (= res!95958 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99846 () ListLongMap!2671)

(assert (=> b!201050 (= lt!99846 lt!99854)))

(assert (=> b!201050 (= lt!99854 (+!378 lt!99843 lt!99841))))

(declare-fun lt!99848 () Unit!6056)

(assert (=> b!201050 (= lt!99848 (addCommutativeForDiffKeys!99 lt!99855 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!201050 (= lt!99840 (+!378 lt!99846 lt!99850))))

(declare-fun lt!99851 () tuple2!3758)

(assert (=> b!201050 (= lt!99846 (+!378 lt!99844 lt!99851))))

(assert (=> b!201050 (= lt!99852 lt!99849)))

(assert (=> b!201050 (= lt!99849 (+!378 lt!99843 lt!99850))))

(assert (=> b!201050 (= lt!99843 (+!378 lt!99855 lt!99851))))

(assert (=> b!201050 (= lt!99840 (+!378 (+!378 lt!99853 lt!99851) lt!99850))))

(assert (=> b!201050 (= lt!99850 (tuple2!3759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201050 (= lt!99851 (tuple2!3759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201051 () Bool)

(declare-fun e!131794 () Bool)

(assert (=> b!201051 (= e!131794 tp_is_empty!4879)))

(declare-fun b!201052 () Bool)

(declare-fun e!131789 () Bool)

(assert (=> b!201052 (= e!131790 (and e!131789 mapRes!8387))))

(declare-fun condMapEmpty!8387 () Bool)

(declare-fun mapDefault!8387 () ValueCell!2096)

