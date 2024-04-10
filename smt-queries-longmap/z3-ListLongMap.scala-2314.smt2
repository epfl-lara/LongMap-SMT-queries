; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37348 () Bool)

(assert start!37348)

(declare-fun b_free!8475 () Bool)

(declare-fun b_next!8475 () Bool)

(assert (=> start!37348 (= b_free!8475 (not b_next!8475))))

(declare-fun tp!30140 () Bool)

(declare-fun b_and!15717 () Bool)

(assert (=> start!37348 (= tp!30140 b_and!15717)))

(declare-fun b!379140 () Bool)

(declare-fun e!230698 () Bool)

(declare-fun e!230702 () Bool)

(assert (=> b!379140 (= e!230698 e!230702)))

(declare-fun res!214915 () Bool)

(assert (=> b!379140 (=> (not res!214915) (not e!230702))))

(declare-datatypes ((array!22169 0))(
  ( (array!22170 (arr!10553 (Array (_ BitVec 32) (_ BitVec 64))) (size!10905 (_ BitVec 32))) )
))
(declare-fun lt!176934 () array!22169)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22169 (_ BitVec 32)) Bool)

(assert (=> b!379140 (= res!214915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176934 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22169)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379140 (= lt!176934 (array!22170 (store (arr!10553 _keys!658) i!548 k0!778) (size!10905 _keys!658)))))

(declare-fun res!214908 () Bool)

(assert (=> start!37348 (=> (not res!214908) (not e!230698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37348 (= res!214908 (validMask!0 mask!970))))

(assert (=> start!37348 e!230698))

(declare-datatypes ((V!13269 0))(
  ( (V!13270 (val!4606 Int)) )
))
(declare-datatypes ((ValueCell!4218 0))(
  ( (ValueCellFull!4218 (v!6803 V!13269)) (EmptyCell!4218) )
))
(declare-datatypes ((array!22171 0))(
  ( (array!22172 (arr!10554 (Array (_ BitVec 32) ValueCell!4218)) (size!10906 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22171)

(declare-fun e!230700 () Bool)

(declare-fun array_inv!7772 (array!22171) Bool)

(assert (=> start!37348 (and (array_inv!7772 _values!506) e!230700)))

(assert (=> start!37348 tp!30140))

(assert (=> start!37348 true))

(declare-fun tp_is_empty!9123 () Bool)

(assert (=> start!37348 tp_is_empty!9123))

(declare-fun array_inv!7773 (array!22169) Bool)

(assert (=> start!37348 (array_inv!7773 _keys!658)))

(declare-fun mapIsEmpty!15249 () Bool)

(declare-fun mapRes!15249 () Bool)

(assert (=> mapIsEmpty!15249 mapRes!15249))

(declare-fun b!379141 () Bool)

(declare-fun res!214911 () Bool)

(assert (=> b!379141 (=> (not res!214911) (not e!230698))))

(assert (=> b!379141 (= res!214911 (or (= (select (arr!10553 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10553 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379142 () Bool)

(declare-fun res!214914 () Bool)

(assert (=> b!379142 (=> (not res!214914) (not e!230702))))

(declare-datatypes ((List!5996 0))(
  ( (Nil!5993) (Cons!5992 (h!6848 (_ BitVec 64)) (t!11146 List!5996)) )
))
(declare-fun arrayNoDuplicates!0 (array!22169 (_ BitVec 32) List!5996) Bool)

(assert (=> b!379142 (= res!214914 (arrayNoDuplicates!0 lt!176934 #b00000000000000000000000000000000 Nil!5993))))

(declare-fun b!379143 () Bool)

(declare-fun res!214917 () Bool)

(assert (=> b!379143 (=> (not res!214917) (not e!230698))))

(assert (=> b!379143 (= res!214917 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10905 _keys!658))))))

(declare-fun mapNonEmpty!15249 () Bool)

(declare-fun tp!30141 () Bool)

(declare-fun e!230699 () Bool)

(assert (=> mapNonEmpty!15249 (= mapRes!15249 (and tp!30141 e!230699))))

(declare-fun mapKey!15249 () (_ BitVec 32))

(declare-fun mapRest!15249 () (Array (_ BitVec 32) ValueCell!4218))

(declare-fun mapValue!15249 () ValueCell!4218)

(assert (=> mapNonEmpty!15249 (= (arr!10554 _values!506) (store mapRest!15249 mapKey!15249 mapValue!15249))))

(declare-fun b!379144 () Bool)

(declare-fun res!214912 () Bool)

(assert (=> b!379144 (=> (not res!214912) (not e!230698))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379144 (= res!214912 (and (= (size!10906 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10905 _keys!658) (size!10906 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379145 () Bool)

(declare-fun res!214918 () Bool)

(assert (=> b!379145 (=> (not res!214918) (not e!230698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379145 (= res!214918 (validKeyInArray!0 k0!778))))

(declare-fun b!379146 () Bool)

(declare-fun e!230697 () Bool)

(assert (=> b!379146 (= e!230697 tp_is_empty!9123)))

(declare-fun b!379147 () Bool)

(declare-fun res!214916 () Bool)

(assert (=> b!379147 (=> (not res!214916) (not e!230698))))

(declare-fun arrayContainsKey!0 (array!22169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379147 (= res!214916 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379148 () Bool)

(declare-fun res!214913 () Bool)

(assert (=> b!379148 (=> (not res!214913) (not e!230698))))

(assert (=> b!379148 (= res!214913 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5993))))

(declare-fun b!379149 () Bool)

(declare-fun e!230695 () Bool)

(assert (=> b!379149 (= e!230702 (not e!230695))))

(declare-fun res!214910 () Bool)

(assert (=> b!379149 (=> res!214910 e!230695)))

(assert (=> b!379149 (= res!214910 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6160 0))(
  ( (tuple2!6161 (_1!3091 (_ BitVec 64)) (_2!3091 V!13269)) )
))
(declare-datatypes ((List!5997 0))(
  ( (Nil!5994) (Cons!5993 (h!6849 tuple2!6160) (t!11147 List!5997)) )
))
(declare-datatypes ((ListLongMap!5073 0))(
  ( (ListLongMap!5074 (toList!2552 List!5997)) )
))
(declare-fun lt!176927 () ListLongMap!5073)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13269)

(declare-fun minValue!472 () V!13269)

(declare-fun getCurrentListMap!1975 (array!22169 array!22171 (_ BitVec 32) (_ BitVec 32) V!13269 V!13269 (_ BitVec 32) Int) ListLongMap!5073)

(assert (=> b!379149 (= lt!176927 (getCurrentListMap!1975 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176932 () array!22171)

(declare-fun lt!176928 () ListLongMap!5073)

(assert (=> b!379149 (= lt!176928 (getCurrentListMap!1975 lt!176934 lt!176932 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176937 () ListLongMap!5073)

(declare-fun lt!176933 () ListLongMap!5073)

(assert (=> b!379149 (and (= lt!176937 lt!176933) (= lt!176933 lt!176937))))

(declare-fun lt!176931 () ListLongMap!5073)

(declare-fun lt!176930 () tuple2!6160)

(declare-fun +!898 (ListLongMap!5073 tuple2!6160) ListLongMap!5073)

(assert (=> b!379149 (= lt!176933 (+!898 lt!176931 lt!176930))))

(declare-fun v!373 () V!13269)

(assert (=> b!379149 (= lt!176930 (tuple2!6161 k0!778 v!373))))

(declare-datatypes ((Unit!11694 0))(
  ( (Unit!11695) )
))
(declare-fun lt!176929 () Unit!11694)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!133 (array!22169 array!22171 (_ BitVec 32) (_ BitVec 32) V!13269 V!13269 (_ BitVec 32) (_ BitVec 64) V!13269 (_ BitVec 32) Int) Unit!11694)

(assert (=> b!379149 (= lt!176929 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!133 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!809 (array!22169 array!22171 (_ BitVec 32) (_ BitVec 32) V!13269 V!13269 (_ BitVec 32) Int) ListLongMap!5073)

(assert (=> b!379149 (= lt!176937 (getCurrentListMapNoExtraKeys!809 lt!176934 lt!176932 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379149 (= lt!176932 (array!22172 (store (arr!10554 _values!506) i!548 (ValueCellFull!4218 v!373)) (size!10906 _values!506)))))

(assert (=> b!379149 (= lt!176931 (getCurrentListMapNoExtraKeys!809 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!379150 () Bool)

(assert (=> b!379150 (= e!230700 (and e!230697 mapRes!15249))))

(declare-fun condMapEmpty!15249 () Bool)

(declare-fun mapDefault!15249 () ValueCell!4218)

(assert (=> b!379150 (= condMapEmpty!15249 (= (arr!10554 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4218)) mapDefault!15249)))))

(declare-fun b!379151 () Bool)

(assert (=> b!379151 (= e!230699 tp_is_empty!9123)))

(declare-fun b!379152 () Bool)

(declare-fun res!214909 () Bool)

(assert (=> b!379152 (=> (not res!214909) (not e!230698))))

(assert (=> b!379152 (= res!214909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379153 () Bool)

(declare-fun e!230696 () Bool)

(assert (=> b!379153 (= e!230695 e!230696)))

(declare-fun res!214919 () Bool)

(assert (=> b!379153 (=> res!214919 e!230696)))

(assert (=> b!379153 (= res!214919 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!176935 () ListLongMap!5073)

(assert (=> b!379153 (= lt!176927 lt!176935)))

(declare-fun lt!176926 () tuple2!6160)

(assert (=> b!379153 (= lt!176935 (+!898 lt!176931 lt!176926))))

(declare-fun lt!176925 () ListLongMap!5073)

(assert (=> b!379153 (= lt!176928 lt!176925)))

(assert (=> b!379153 (= lt!176925 (+!898 lt!176933 lt!176926))))

(assert (=> b!379153 (= lt!176928 (+!898 lt!176937 lt!176926))))

(assert (=> b!379153 (= lt!176926 (tuple2!6161 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!379154 () Bool)

(assert (=> b!379154 (= e!230696 true)))

(assert (=> b!379154 (= lt!176925 (+!898 lt!176935 lt!176930))))

(declare-fun lt!176936 () Unit!11694)

(declare-fun addCommutativeForDiffKeys!297 (ListLongMap!5073 (_ BitVec 64) V!13269 (_ BitVec 64) V!13269) Unit!11694)

(assert (=> b!379154 (= lt!176936 (addCommutativeForDiffKeys!297 lt!176931 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (= (and start!37348 res!214908) b!379144))

(assert (= (and b!379144 res!214912) b!379152))

(assert (= (and b!379152 res!214909) b!379148))

(assert (= (and b!379148 res!214913) b!379143))

(assert (= (and b!379143 res!214917) b!379145))

(assert (= (and b!379145 res!214918) b!379141))

(assert (= (and b!379141 res!214911) b!379147))

(assert (= (and b!379147 res!214916) b!379140))

(assert (= (and b!379140 res!214915) b!379142))

(assert (= (and b!379142 res!214914) b!379149))

(assert (= (and b!379149 (not res!214910)) b!379153))

(assert (= (and b!379153 (not res!214919)) b!379154))

(assert (= (and b!379150 condMapEmpty!15249) mapIsEmpty!15249))

(assert (= (and b!379150 (not condMapEmpty!15249)) mapNonEmpty!15249))

(get-info :version)

(assert (= (and mapNonEmpty!15249 ((_ is ValueCellFull!4218) mapValue!15249)) b!379151))

(assert (= (and b!379150 ((_ is ValueCellFull!4218) mapDefault!15249)) b!379146))

(assert (= start!37348 b!379150))

(declare-fun m!375999 () Bool)

(assert (=> b!379152 m!375999))

(declare-fun m!376001 () Bool)

(assert (=> start!37348 m!376001))

(declare-fun m!376003 () Bool)

(assert (=> start!37348 m!376003))

(declare-fun m!376005 () Bool)

(assert (=> start!37348 m!376005))

(declare-fun m!376007 () Bool)

(assert (=> b!379149 m!376007))

(declare-fun m!376009 () Bool)

(assert (=> b!379149 m!376009))

(declare-fun m!376011 () Bool)

(assert (=> b!379149 m!376011))

(declare-fun m!376013 () Bool)

(assert (=> b!379149 m!376013))

(declare-fun m!376015 () Bool)

(assert (=> b!379149 m!376015))

(declare-fun m!376017 () Bool)

(assert (=> b!379149 m!376017))

(declare-fun m!376019 () Bool)

(assert (=> b!379149 m!376019))

(declare-fun m!376021 () Bool)

(assert (=> b!379141 m!376021))

(declare-fun m!376023 () Bool)

(assert (=> b!379147 m!376023))

(declare-fun m!376025 () Bool)

(assert (=> b!379140 m!376025))

(declare-fun m!376027 () Bool)

(assert (=> b!379140 m!376027))

(declare-fun m!376029 () Bool)

(assert (=> b!379145 m!376029))

(declare-fun m!376031 () Bool)

(assert (=> b!379153 m!376031))

(declare-fun m!376033 () Bool)

(assert (=> b!379153 m!376033))

(declare-fun m!376035 () Bool)

(assert (=> b!379153 m!376035))

(declare-fun m!376037 () Bool)

(assert (=> b!379154 m!376037))

(declare-fun m!376039 () Bool)

(assert (=> b!379154 m!376039))

(declare-fun m!376041 () Bool)

(assert (=> mapNonEmpty!15249 m!376041))

(declare-fun m!376043 () Bool)

(assert (=> b!379148 m!376043))

(declare-fun m!376045 () Bool)

(assert (=> b!379142 m!376045))

(check-sat (not b!379149) (not b!379142) (not b!379152) (not b_next!8475) (not mapNonEmpty!15249) (not b!379153) (not b!379145) (not b!379147) b_and!15717 (not start!37348) (not b!379148) (not b!379154) tp_is_empty!9123 (not b!379140))
(check-sat b_and!15717 (not b_next!8475))
