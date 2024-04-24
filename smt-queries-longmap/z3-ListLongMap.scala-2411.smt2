; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38136 () Bool)

(assert start!38136)

(declare-fun b_free!9031 () Bool)

(declare-fun b_next!9031 () Bool)

(assert (=> start!38136 (= b_free!9031 (not b_next!9031))))

(declare-fun tp!31874 () Bool)

(declare-fun b_and!16407 () Bool)

(assert (=> start!38136 (= tp!31874 b_and!16407)))

(declare-fun b!393160 () Bool)

(declare-fun e!238060 () Bool)

(declare-fun e!238057 () Bool)

(assert (=> b!393160 (= e!238060 e!238057)))

(declare-fun res!225244 () Bool)

(assert (=> b!393160 (=> res!225244 e!238057)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!393160 (= res!225244 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!14043 0))(
  ( (V!14044 (val!4896 Int)) )
))
(declare-datatypes ((tuple2!6470 0))(
  ( (tuple2!6471 (_1!3246 (_ BitVec 64)) (_2!3246 V!14043)) )
))
(declare-datatypes ((List!6318 0))(
  ( (Nil!6315) (Cons!6314 (h!7170 tuple2!6470) (t!11480 List!6318)) )
))
(declare-datatypes ((ListLongMap!5385 0))(
  ( (ListLongMap!5386 (toList!2708 List!6318)) )
))
(declare-fun lt!186047 () ListLongMap!5385)

(declare-fun lt!186049 () ListLongMap!5385)

(assert (=> b!393160 (= lt!186047 lt!186049)))

(declare-fun lt!186052 () ListLongMap!5385)

(declare-fun lt!186050 () tuple2!6470)

(declare-fun +!1062 (ListLongMap!5385 tuple2!6470) ListLongMap!5385)

(assert (=> b!393160 (= lt!186049 (+!1062 lt!186052 lt!186050))))

(declare-fun lt!186051 () ListLongMap!5385)

(declare-fun lt!186056 () ListLongMap!5385)

(assert (=> b!393160 (= lt!186051 lt!186056)))

(declare-fun lt!186048 () ListLongMap!5385)

(assert (=> b!393160 (= lt!186056 (+!1062 lt!186048 lt!186050))))

(declare-fun lt!186044 () ListLongMap!5385)

(assert (=> b!393160 (= lt!186051 (+!1062 lt!186044 lt!186050))))

(declare-fun minValue!472 () V!14043)

(assert (=> b!393160 (= lt!186050 (tuple2!6471 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!393161 () Bool)

(declare-fun e!238055 () Bool)

(declare-fun tp_is_empty!9703 () Bool)

(assert (=> b!393161 (= e!238055 tp_is_empty!9703)))

(declare-fun b!393162 () Bool)

(declare-fun res!225252 () Bool)

(declare-fun e!238054 () Bool)

(assert (=> b!393162 (=> (not res!225252) (not e!238054))))

(declare-datatypes ((array!23300 0))(
  ( (array!23301 (arr!11108 (Array (_ BitVec 32) (_ BitVec 64))) (size!11460 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23300)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23300 (_ BitVec 32)) Bool)

(assert (=> b!393162 (= res!225252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393163 () Bool)

(declare-fun res!225247 () Bool)

(declare-fun e!238058 () Bool)

(assert (=> b!393163 (=> (not res!225247) (not e!238058))))

(declare-fun lt!186053 () array!23300)

(declare-datatypes ((List!6319 0))(
  ( (Nil!6316) (Cons!6315 (h!7171 (_ BitVec 64)) (t!11481 List!6319)) )
))
(declare-fun arrayNoDuplicates!0 (array!23300 (_ BitVec 32) List!6319) Bool)

(assert (=> b!393163 (= res!225247 (arrayNoDuplicates!0 lt!186053 #b00000000000000000000000000000000 Nil!6316))))

(declare-fun b!393164 () Bool)

(declare-fun res!225246 () Bool)

(assert (=> b!393164 (=> (not res!225246) (not e!238054))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!393164 (= res!225246 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11460 _keys!658))))))

(declare-fun b!393165 () Bool)

(declare-fun e!238061 () Bool)

(declare-fun e!238056 () Bool)

(declare-fun mapRes!16149 () Bool)

(assert (=> b!393165 (= e!238061 (and e!238056 mapRes!16149))))

(declare-fun condMapEmpty!16149 () Bool)

(declare-datatypes ((ValueCell!4508 0))(
  ( (ValueCellFull!4508 (v!7134 V!14043)) (EmptyCell!4508) )
))
(declare-datatypes ((array!23302 0))(
  ( (array!23303 (arr!11109 (Array (_ BitVec 32) ValueCell!4508)) (size!11461 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23302)

(declare-fun mapDefault!16149 () ValueCell!4508)

(assert (=> b!393165 (= condMapEmpty!16149 (= (arr!11109 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4508)) mapDefault!16149)))))

(declare-fun b!393166 () Bool)

(declare-fun res!225245 () Bool)

(assert (=> b!393166 (=> (not res!225245) (not e!238054))))

(assert (=> b!393166 (= res!225245 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6316))))

(declare-fun lt!186055 () tuple2!6470)

(declare-fun b!393167 () Bool)

(assert (=> b!393167 (= e!238057 (= (+!1062 lt!186047 lt!186055) lt!186051))))

(assert (=> b!393167 (= lt!186056 (+!1062 lt!186049 lt!186055))))

(declare-fun v!373 () V!14043)

(declare-datatypes ((Unit!11993 0))(
  ( (Unit!11994) )
))
(declare-fun lt!186046 () Unit!11993)

(declare-fun addCommutativeForDiffKeys!348 (ListLongMap!5385 (_ BitVec 64) V!14043 (_ BitVec 64) V!14043) Unit!11993)

(assert (=> b!393167 (= lt!186046 (addCommutativeForDiffKeys!348 lt!186052 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!16149 () Bool)

(assert (=> mapIsEmpty!16149 mapRes!16149))

(declare-fun b!393168 () Bool)

(declare-fun res!225249 () Bool)

(assert (=> b!393168 (=> (not res!225249) (not e!238054))))

(declare-fun arrayContainsKey!0 (array!23300 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393168 (= res!225249 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!225248 () Bool)

(assert (=> start!38136 (=> (not res!225248) (not e!238054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38136 (= res!225248 (validMask!0 mask!970))))

(assert (=> start!38136 e!238054))

(declare-fun array_inv!8208 (array!23302) Bool)

(assert (=> start!38136 (and (array_inv!8208 _values!506) e!238061)))

(assert (=> start!38136 tp!31874))

(assert (=> start!38136 true))

(assert (=> start!38136 tp_is_empty!9703))

(declare-fun array_inv!8209 (array!23300) Bool)

(assert (=> start!38136 (array_inv!8209 _keys!658)))

(declare-fun b!393169 () Bool)

(declare-fun res!225251 () Bool)

(assert (=> b!393169 (=> (not res!225251) (not e!238054))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393169 (= res!225251 (and (= (size!11461 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11460 _keys!658) (size!11461 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393170 () Bool)

(declare-fun res!225254 () Bool)

(assert (=> b!393170 (=> (not res!225254) (not e!238054))))

(assert (=> b!393170 (= res!225254 (or (= (select (arr!11108 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11108 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393171 () Bool)

(assert (=> b!393171 (= e!238058 (not e!238060))))

(declare-fun res!225255 () Bool)

(assert (=> b!393171 (=> res!225255 e!238060)))

(assert (=> b!393171 (= res!225255 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14043)

(declare-fun getCurrentListMap!2083 (array!23300 array!23302 (_ BitVec 32) (_ BitVec 32) V!14043 V!14043 (_ BitVec 32) Int) ListLongMap!5385)

(assert (=> b!393171 (= lt!186047 (getCurrentListMap!2083 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186045 () array!23302)

(assert (=> b!393171 (= lt!186051 (getCurrentListMap!2083 lt!186053 lt!186045 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393171 (and (= lt!186044 lt!186048) (= lt!186048 lt!186044))))

(assert (=> b!393171 (= lt!186048 (+!1062 lt!186052 lt!186055))))

(assert (=> b!393171 (= lt!186055 (tuple2!6471 k0!778 v!373))))

(declare-fun lt!186054 () Unit!11993)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!274 (array!23300 array!23302 (_ BitVec 32) (_ BitVec 32) V!14043 V!14043 (_ BitVec 32) (_ BitVec 64) V!14043 (_ BitVec 32) Int) Unit!11993)

(assert (=> b!393171 (= lt!186054 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!274 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!972 (array!23300 array!23302 (_ BitVec 32) (_ BitVec 32) V!14043 V!14043 (_ BitVec 32) Int) ListLongMap!5385)

(assert (=> b!393171 (= lt!186044 (getCurrentListMapNoExtraKeys!972 lt!186053 lt!186045 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393171 (= lt!186045 (array!23303 (store (arr!11109 _values!506) i!548 (ValueCellFull!4508 v!373)) (size!11461 _values!506)))))

(assert (=> b!393171 (= lt!186052 (getCurrentListMapNoExtraKeys!972 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393172 () Bool)

(assert (=> b!393172 (= e!238056 tp_is_empty!9703)))

(declare-fun b!393173 () Bool)

(declare-fun res!225253 () Bool)

(assert (=> b!393173 (=> (not res!225253) (not e!238054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393173 (= res!225253 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!16149 () Bool)

(declare-fun tp!31875 () Bool)

(assert (=> mapNonEmpty!16149 (= mapRes!16149 (and tp!31875 e!238055))))

(declare-fun mapValue!16149 () ValueCell!4508)

(declare-fun mapRest!16149 () (Array (_ BitVec 32) ValueCell!4508))

(declare-fun mapKey!16149 () (_ BitVec 32))

(assert (=> mapNonEmpty!16149 (= (arr!11109 _values!506) (store mapRest!16149 mapKey!16149 mapValue!16149))))

(declare-fun b!393174 () Bool)

(assert (=> b!393174 (= e!238054 e!238058)))

(declare-fun res!225250 () Bool)

(assert (=> b!393174 (=> (not res!225250) (not e!238058))))

(assert (=> b!393174 (= res!225250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186053 mask!970))))

(assert (=> b!393174 (= lt!186053 (array!23301 (store (arr!11108 _keys!658) i!548 k0!778) (size!11460 _keys!658)))))

(assert (= (and start!38136 res!225248) b!393169))

(assert (= (and b!393169 res!225251) b!393162))

(assert (= (and b!393162 res!225252) b!393166))

(assert (= (and b!393166 res!225245) b!393164))

(assert (= (and b!393164 res!225246) b!393173))

(assert (= (and b!393173 res!225253) b!393170))

(assert (= (and b!393170 res!225254) b!393168))

(assert (= (and b!393168 res!225249) b!393174))

(assert (= (and b!393174 res!225250) b!393163))

(assert (= (and b!393163 res!225247) b!393171))

(assert (= (and b!393171 (not res!225255)) b!393160))

(assert (= (and b!393160 (not res!225244)) b!393167))

(assert (= (and b!393165 condMapEmpty!16149) mapIsEmpty!16149))

(assert (= (and b!393165 (not condMapEmpty!16149)) mapNonEmpty!16149))

(get-info :version)

(assert (= (and mapNonEmpty!16149 ((_ is ValueCellFull!4508) mapValue!16149)) b!393161))

(assert (= (and b!393165 ((_ is ValueCellFull!4508) mapDefault!16149)) b!393172))

(assert (= start!38136 b!393165))

(declare-fun m!389893 () Bool)

(assert (=> b!393173 m!389893))

(declare-fun m!389895 () Bool)

(assert (=> start!38136 m!389895))

(declare-fun m!389897 () Bool)

(assert (=> start!38136 m!389897))

(declare-fun m!389899 () Bool)

(assert (=> start!38136 m!389899))

(declare-fun m!389901 () Bool)

(assert (=> b!393160 m!389901))

(declare-fun m!389903 () Bool)

(assert (=> b!393160 m!389903))

(declare-fun m!389905 () Bool)

(assert (=> b!393160 m!389905))

(declare-fun m!389907 () Bool)

(assert (=> b!393170 m!389907))

(declare-fun m!389909 () Bool)

(assert (=> mapNonEmpty!16149 m!389909))

(declare-fun m!389911 () Bool)

(assert (=> b!393163 m!389911))

(declare-fun m!389913 () Bool)

(assert (=> b!393174 m!389913))

(declare-fun m!389915 () Bool)

(assert (=> b!393174 m!389915))

(declare-fun m!389917 () Bool)

(assert (=> b!393167 m!389917))

(declare-fun m!389919 () Bool)

(assert (=> b!393167 m!389919))

(declare-fun m!389921 () Bool)

(assert (=> b!393167 m!389921))

(declare-fun m!389923 () Bool)

(assert (=> b!393162 m!389923))

(declare-fun m!389925 () Bool)

(assert (=> b!393171 m!389925))

(declare-fun m!389927 () Bool)

(assert (=> b!393171 m!389927))

(declare-fun m!389929 () Bool)

(assert (=> b!393171 m!389929))

(declare-fun m!389931 () Bool)

(assert (=> b!393171 m!389931))

(declare-fun m!389933 () Bool)

(assert (=> b!393171 m!389933))

(declare-fun m!389935 () Bool)

(assert (=> b!393171 m!389935))

(declare-fun m!389937 () Bool)

(assert (=> b!393171 m!389937))

(declare-fun m!389939 () Bool)

(assert (=> b!393168 m!389939))

(declare-fun m!389941 () Bool)

(assert (=> b!393166 m!389941))

(check-sat (not b!393171) (not b!393167) (not b!393166) (not b!393174) tp_is_empty!9703 (not b!393173) b_and!16407 (not b!393168) (not b!393162) (not b_next!9031) (not start!38136) (not b!393163) (not mapNonEmpty!16149) (not b!393160))
(check-sat b_and!16407 (not b_next!9031))
