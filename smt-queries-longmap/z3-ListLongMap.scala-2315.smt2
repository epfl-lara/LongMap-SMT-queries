; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37354 () Bool)

(assert start!37354)

(declare-fun b_free!8481 () Bool)

(declare-fun b_next!8481 () Bool)

(assert (=> start!37354 (= b_free!8481 (not b_next!8481))))

(declare-fun tp!30159 () Bool)

(declare-fun b_and!15723 () Bool)

(assert (=> start!37354 (= tp!30159 b_and!15723)))

(declare-fun b!379275 () Bool)

(declare-fun e!230774 () Bool)

(declare-fun tp_is_empty!9129 () Bool)

(assert (=> b!379275 (= e!230774 tp_is_empty!9129)))

(declare-fun b!379276 () Bool)

(declare-fun res!215016 () Bool)

(declare-fun e!230767 () Bool)

(assert (=> b!379276 (=> (not res!215016) (not e!230767))))

(declare-datatypes ((array!22181 0))(
  ( (array!22182 (arr!10559 (Array (_ BitVec 32) (_ BitVec 64))) (size!10911 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22181)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22181 (_ BitVec 32)) Bool)

(assert (=> b!379276 (= res!215016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!379277 () Bool)

(declare-fun res!215027 () Bool)

(assert (=> b!379277 (=> (not res!215027) (not e!230767))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!379277 (= res!215027 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!379279 () Bool)

(declare-fun res!215017 () Bool)

(declare-fun e!230770 () Bool)

(assert (=> b!379279 (=> (not res!215017) (not e!230770))))

(declare-fun lt!177044 () array!22181)

(declare-datatypes ((List!6002 0))(
  ( (Nil!5999) (Cons!5998 (h!6854 (_ BitVec 64)) (t!11152 List!6002)) )
))
(declare-fun arrayNoDuplicates!0 (array!22181 (_ BitVec 32) List!6002) Bool)

(assert (=> b!379279 (= res!215017 (arrayNoDuplicates!0 lt!177044 #b00000000000000000000000000000000 Nil!5999))))

(declare-fun b!379280 () Bool)

(declare-fun e!230768 () Bool)

(assert (=> b!379280 (= e!230768 true)))

(declare-datatypes ((V!13277 0))(
  ( (V!13278 (val!4609 Int)) )
))
(declare-datatypes ((tuple2!6166 0))(
  ( (tuple2!6167 (_1!3094 (_ BitVec 64)) (_2!3094 V!13277)) )
))
(declare-datatypes ((List!6003 0))(
  ( (Nil!6000) (Cons!5999 (h!6855 tuple2!6166) (t!11153 List!6003)) )
))
(declare-datatypes ((ListLongMap!5079 0))(
  ( (ListLongMap!5080 (toList!2555 List!6003)) )
))
(declare-fun lt!177048 () ListLongMap!5079)

(declare-fun lt!177045 () ListLongMap!5079)

(declare-fun lt!177046 () tuple2!6166)

(declare-fun +!901 (ListLongMap!5079 tuple2!6166) ListLongMap!5079)

(assert (=> b!379280 (= lt!177048 (+!901 lt!177045 lt!177046))))

(declare-fun v!373 () V!13277)

(declare-datatypes ((Unit!11700 0))(
  ( (Unit!11701) )
))
(declare-fun lt!177049 () Unit!11700)

(declare-fun lt!177053 () ListLongMap!5079)

(declare-fun minValue!472 () V!13277)

(declare-fun addCommutativeForDiffKeys!300 (ListLongMap!5079 (_ BitVec 64) V!13277 (_ BitVec 64) V!13277) Unit!11700)

(assert (=> b!379280 (= lt!177049 (addCommutativeForDiffKeys!300 lt!177053 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!15258 () Bool)

(declare-fun mapRes!15258 () Bool)

(declare-fun tp!30158 () Bool)

(assert (=> mapNonEmpty!15258 (= mapRes!15258 (and tp!30158 e!230774))))

(declare-fun mapKey!15258 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4221 0))(
  ( (ValueCellFull!4221 (v!6806 V!13277)) (EmptyCell!4221) )
))
(declare-fun mapRest!15258 () (Array (_ BitVec 32) ValueCell!4221))

(declare-fun mapValue!15258 () ValueCell!4221)

(declare-datatypes ((array!22183 0))(
  ( (array!22184 (arr!10560 (Array (_ BitVec 32) ValueCell!4221)) (size!10912 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22183)

(assert (=> mapNonEmpty!15258 (= (arr!10560 _values!506) (store mapRest!15258 mapKey!15258 mapValue!15258))))

(declare-fun b!379281 () Bool)

(declare-fun e!230772 () Bool)

(declare-fun e!230771 () Bool)

(assert (=> b!379281 (= e!230772 (and e!230771 mapRes!15258))))

(declare-fun condMapEmpty!15258 () Bool)

(declare-fun mapDefault!15258 () ValueCell!4221)

(assert (=> b!379281 (= condMapEmpty!15258 (= (arr!10560 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4221)) mapDefault!15258)))))

(declare-fun b!379282 () Bool)

(declare-fun res!215022 () Bool)

(assert (=> b!379282 (=> (not res!215022) (not e!230767))))

(assert (=> b!379282 (= res!215022 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5999))))

(declare-fun b!379283 () Bool)

(declare-fun res!215025 () Bool)

(assert (=> b!379283 (=> (not res!215025) (not e!230767))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!379283 (= res!215025 (and (= (size!10912 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10911 _keys!658) (size!10912 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!379284 () Bool)

(declare-fun res!215024 () Bool)

(assert (=> b!379284 (=> (not res!215024) (not e!230767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!379284 (= res!215024 (validKeyInArray!0 k0!778))))

(declare-fun b!379278 () Bool)

(assert (=> b!379278 (= e!230771 tp_is_empty!9129)))

(declare-fun res!215020 () Bool)

(assert (=> start!37354 (=> (not res!215020) (not e!230767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37354 (= res!215020 (validMask!0 mask!970))))

(assert (=> start!37354 e!230767))

(declare-fun array_inv!7776 (array!22183) Bool)

(assert (=> start!37354 (and (array_inv!7776 _values!506) e!230772)))

(assert (=> start!37354 tp!30159))

(assert (=> start!37354 true))

(assert (=> start!37354 tp_is_empty!9129))

(declare-fun array_inv!7777 (array!22181) Bool)

(assert (=> start!37354 (array_inv!7777 _keys!658)))

(declare-fun b!379285 () Bool)

(declare-fun e!230773 () Bool)

(assert (=> b!379285 (= e!230773 e!230768)))

(declare-fun res!215019 () Bool)

(assert (=> b!379285 (=> res!215019 e!230768)))

(assert (=> b!379285 (= res!215019 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!177047 () ListLongMap!5079)

(assert (=> b!379285 (= lt!177047 lt!177045)))

(declare-fun lt!177050 () tuple2!6166)

(assert (=> b!379285 (= lt!177045 (+!901 lt!177053 lt!177050))))

(declare-fun lt!177043 () ListLongMap!5079)

(assert (=> b!379285 (= lt!177043 lt!177048)))

(declare-fun lt!177052 () ListLongMap!5079)

(assert (=> b!379285 (= lt!177048 (+!901 lt!177052 lt!177050))))

(declare-fun lt!177042 () ListLongMap!5079)

(assert (=> b!379285 (= lt!177043 (+!901 lt!177042 lt!177050))))

(assert (=> b!379285 (= lt!177050 (tuple2!6167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapIsEmpty!15258 () Bool)

(assert (=> mapIsEmpty!15258 mapRes!15258))

(declare-fun b!379286 () Bool)

(declare-fun res!215021 () Bool)

(assert (=> b!379286 (=> (not res!215021) (not e!230767))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!379286 (= res!215021 (or (= (select (arr!10559 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10559 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!379287 () Bool)

(assert (=> b!379287 (= e!230767 e!230770)))

(declare-fun res!215026 () Bool)

(assert (=> b!379287 (=> (not res!215026) (not e!230770))))

(assert (=> b!379287 (= res!215026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177044 mask!970))))

(assert (=> b!379287 (= lt!177044 (array!22182 (store (arr!10559 _keys!658) i!548 k0!778) (size!10911 _keys!658)))))

(declare-fun b!379288 () Bool)

(declare-fun res!215018 () Bool)

(assert (=> b!379288 (=> (not res!215018) (not e!230767))))

(assert (=> b!379288 (= res!215018 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10911 _keys!658))))))

(declare-fun b!379289 () Bool)

(assert (=> b!379289 (= e!230770 (not e!230773))))

(declare-fun res!215023 () Bool)

(assert (=> b!379289 (=> res!215023 e!230773)))

(assert (=> b!379289 (= res!215023 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13277)

(declare-fun getCurrentListMap!1977 (array!22181 array!22183 (_ BitVec 32) (_ BitVec 32) V!13277 V!13277 (_ BitVec 32) Int) ListLongMap!5079)

(assert (=> b!379289 (= lt!177047 (getCurrentListMap!1977 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177054 () array!22183)

(assert (=> b!379289 (= lt!177043 (getCurrentListMap!1977 lt!177044 lt!177054 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379289 (and (= lt!177042 lt!177052) (= lt!177052 lt!177042))))

(assert (=> b!379289 (= lt!177052 (+!901 lt!177053 lt!177046))))

(assert (=> b!379289 (= lt!177046 (tuple2!6167 k0!778 v!373))))

(declare-fun lt!177051 () Unit!11700)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!135 (array!22181 array!22183 (_ BitVec 32) (_ BitVec 32) V!13277 V!13277 (_ BitVec 32) (_ BitVec 64) V!13277 (_ BitVec 32) Int) Unit!11700)

(assert (=> b!379289 (= lt!177051 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!135 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!811 (array!22181 array!22183 (_ BitVec 32) (_ BitVec 32) V!13277 V!13277 (_ BitVec 32) Int) ListLongMap!5079)

(assert (=> b!379289 (= lt!177042 (getCurrentListMapNoExtraKeys!811 lt!177044 lt!177054 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!379289 (= lt!177054 (array!22184 (store (arr!10560 _values!506) i!548 (ValueCellFull!4221 v!373)) (size!10912 _values!506)))))

(assert (=> b!379289 (= lt!177053 (getCurrentListMapNoExtraKeys!811 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37354 res!215020) b!379283))

(assert (= (and b!379283 res!215025) b!379276))

(assert (= (and b!379276 res!215016) b!379282))

(assert (= (and b!379282 res!215022) b!379288))

(assert (= (and b!379288 res!215018) b!379284))

(assert (= (and b!379284 res!215024) b!379286))

(assert (= (and b!379286 res!215021) b!379277))

(assert (= (and b!379277 res!215027) b!379287))

(assert (= (and b!379287 res!215026) b!379279))

(assert (= (and b!379279 res!215017) b!379289))

(assert (= (and b!379289 (not res!215023)) b!379285))

(assert (= (and b!379285 (not res!215019)) b!379280))

(assert (= (and b!379281 condMapEmpty!15258) mapIsEmpty!15258))

(assert (= (and b!379281 (not condMapEmpty!15258)) mapNonEmpty!15258))

(get-info :version)

(assert (= (and mapNonEmpty!15258 ((_ is ValueCellFull!4221) mapValue!15258)) b!379275))

(assert (= (and b!379281 ((_ is ValueCellFull!4221) mapDefault!15258)) b!379278))

(assert (= start!37354 b!379281))

(declare-fun m!376143 () Bool)

(assert (=> b!379287 m!376143))

(declare-fun m!376145 () Bool)

(assert (=> b!379287 m!376145))

(declare-fun m!376147 () Bool)

(assert (=> b!379282 m!376147))

(declare-fun m!376149 () Bool)

(assert (=> b!379276 m!376149))

(declare-fun m!376151 () Bool)

(assert (=> b!379285 m!376151))

(declare-fun m!376153 () Bool)

(assert (=> b!379285 m!376153))

(declare-fun m!376155 () Bool)

(assert (=> b!379285 m!376155))

(declare-fun m!376157 () Bool)

(assert (=> start!37354 m!376157))

(declare-fun m!376159 () Bool)

(assert (=> start!37354 m!376159))

(declare-fun m!376161 () Bool)

(assert (=> start!37354 m!376161))

(declare-fun m!376163 () Bool)

(assert (=> b!379284 m!376163))

(declare-fun m!376165 () Bool)

(assert (=> mapNonEmpty!15258 m!376165))

(declare-fun m!376167 () Bool)

(assert (=> b!379286 m!376167))

(declare-fun m!376169 () Bool)

(assert (=> b!379289 m!376169))

(declare-fun m!376171 () Bool)

(assert (=> b!379289 m!376171))

(declare-fun m!376173 () Bool)

(assert (=> b!379289 m!376173))

(declare-fun m!376175 () Bool)

(assert (=> b!379289 m!376175))

(declare-fun m!376177 () Bool)

(assert (=> b!379289 m!376177))

(declare-fun m!376179 () Bool)

(assert (=> b!379289 m!376179))

(declare-fun m!376181 () Bool)

(assert (=> b!379289 m!376181))

(declare-fun m!376183 () Bool)

(assert (=> b!379277 m!376183))

(declare-fun m!376185 () Bool)

(assert (=> b!379279 m!376185))

(declare-fun m!376187 () Bool)

(assert (=> b!379280 m!376187))

(declare-fun m!376189 () Bool)

(assert (=> b!379280 m!376189))

(check-sat tp_is_empty!9129 (not b!379282) b_and!15723 (not b!379276) (not b!379277) (not b!379279) (not mapNonEmpty!15258) (not start!37354) (not b!379284) (not b!379285) (not b!379280) (not b!379289) (not b_next!8481) (not b!379287))
(check-sat b_and!15723 (not b_next!8481))
