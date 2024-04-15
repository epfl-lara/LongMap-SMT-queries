; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39194 () Bool)

(assert start!39194)

(declare-fun b_free!9475 () Bool)

(declare-fun b_next!9475 () Bool)

(assert (=> start!39194 (= b_free!9475 (not b_next!9475))))

(declare-fun tp!33953 () Bool)

(declare-fun b_and!16835 () Bool)

(assert (=> start!39194 (= tp!33953 b_and!16835)))

(declare-fun b!413108 () Bool)

(declare-fun res!240079 () Bool)

(declare-fun e!247036 () Bool)

(assert (=> b!413108 (=> (not res!240079) (not e!247036))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413108 (= res!240079 (bvsle from!863 i!563))))

(declare-fun b!413109 () Bool)

(declare-fun e!247033 () Bool)

(assert (=> b!413109 (= e!247033 e!247036)))

(declare-fun res!240077 () Bool)

(assert (=> b!413109 (=> (not res!240077) (not e!247036))))

(declare-datatypes ((array!25105 0))(
  ( (array!25106 (arr!12002 (Array (_ BitVec 32) (_ BitVec 64))) (size!12355 (_ BitVec 32))) )
))
(declare-fun lt!189475 () array!25105)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25105 (_ BitVec 32)) Bool)

(assert (=> b!413109 (= res!240077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189475 mask!1025))))

(declare-fun _keys!709 () array!25105)

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!413109 (= lt!189475 (array!25106 (store (arr!12002 _keys!709) i!563 k0!794) (size!12355 _keys!709)))))

(declare-fun b!413110 () Bool)

(declare-fun res!240072 () Bool)

(assert (=> b!413110 (=> (not res!240072) (not e!247033))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15275 0))(
  ( (V!15276 (val!5358 Int)) )
))
(declare-datatypes ((ValueCell!4970 0))(
  ( (ValueCellFull!4970 (v!7599 V!15275)) (EmptyCell!4970) )
))
(declare-datatypes ((array!25107 0))(
  ( (array!25108 (arr!12003 (Array (_ BitVec 32) ValueCell!4970)) (size!12356 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25107)

(assert (=> b!413110 (= res!240072 (and (= (size!12356 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12355 _keys!709) (size!12356 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413111 () Bool)

(declare-fun res!240082 () Bool)

(assert (=> b!413111 (=> (not res!240082) (not e!247033))))

(assert (=> b!413111 (= res!240082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413112 () Bool)

(declare-fun e!247038 () Bool)

(assert (=> b!413112 (= e!247036 e!247038)))

(declare-fun res!240084 () Bool)

(assert (=> b!413112 (=> (not res!240084) (not e!247038))))

(assert (=> b!413112 (= res!240084 (= from!863 i!563))))

(declare-fun minValue!515 () V!15275)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6942 0))(
  ( (tuple2!6943 (_1!3482 (_ BitVec 64)) (_2!3482 V!15275)) )
))
(declare-datatypes ((List!6960 0))(
  ( (Nil!6957) (Cons!6956 (h!7812 tuple2!6942) (t!12125 List!6960)) )
))
(declare-datatypes ((ListLongMap!5845 0))(
  ( (ListLongMap!5846 (toList!2938 List!6960)) )
))
(declare-fun lt!189476 () ListLongMap!5845)

(declare-fun zeroValue!515 () V!15275)

(declare-fun lt!189479 () array!25107)

(declare-fun getCurrentListMapNoExtraKeys!1152 (array!25105 array!25107 (_ BitVec 32) (_ BitVec 32) V!15275 V!15275 (_ BitVec 32) Int) ListLongMap!5845)

(assert (=> b!413112 (= lt!189476 (getCurrentListMapNoExtraKeys!1152 lt!189475 lt!189479 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15275)

(assert (=> b!413112 (= lt!189479 (array!25108 (store (arr!12003 _values!549) i!563 (ValueCellFull!4970 v!412)) (size!12356 _values!549)))))

(declare-fun lt!189478 () ListLongMap!5845)

(assert (=> b!413112 (= lt!189478 (getCurrentListMapNoExtraKeys!1152 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413113 () Bool)

(declare-fun e!247034 () Bool)

(declare-fun call!28578 () ListLongMap!5845)

(declare-fun call!28579 () ListLongMap!5845)

(assert (=> b!413113 (= e!247034 (= call!28578 call!28579))))

(declare-fun b!413114 () Bool)

(declare-fun +!1180 (ListLongMap!5845 tuple2!6942) ListLongMap!5845)

(assert (=> b!413114 (= e!247034 (= call!28578 (+!1180 call!28579 (tuple2!6943 k0!794 v!412))))))

(declare-fun b!413115 () Bool)

(declare-fun e!247032 () Bool)

(declare-fun e!247031 () Bool)

(declare-fun mapRes!17562 () Bool)

(assert (=> b!413115 (= e!247032 (and e!247031 mapRes!17562))))

(declare-fun condMapEmpty!17562 () Bool)

(declare-fun mapDefault!17562 () ValueCell!4970)

(assert (=> b!413115 (= condMapEmpty!17562 (= (arr!12003 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4970)) mapDefault!17562)))))

(declare-fun mapIsEmpty!17562 () Bool)

(assert (=> mapIsEmpty!17562 mapRes!17562))

(declare-fun b!413116 () Bool)

(declare-fun res!240081 () Bool)

(assert (=> b!413116 (=> (not res!240081) (not e!247033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413116 (= res!240081 (validMask!0 mask!1025))))

(declare-fun b!413117 () Bool)

(declare-fun tp_is_empty!10627 () Bool)

(assert (=> b!413117 (= e!247031 tp_is_empty!10627)))

(declare-fun b!413118 () Bool)

(assert (=> b!413118 (= e!247038 (not true))))

(assert (=> b!413118 e!247034))

(declare-fun c!54855 () Bool)

(assert (=> b!413118 (= c!54855 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12202 0))(
  ( (Unit!12203) )
))
(declare-fun lt!189477 () Unit!12202)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!364 (array!25105 array!25107 (_ BitVec 32) (_ BitVec 32) V!15275 V!15275 (_ BitVec 32) (_ BitVec 64) V!15275 (_ BitVec 32) Int) Unit!12202)

(assert (=> b!413118 (= lt!189477 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!364 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17562 () Bool)

(declare-fun tp!33954 () Bool)

(declare-fun e!247035 () Bool)

(assert (=> mapNonEmpty!17562 (= mapRes!17562 (and tp!33954 e!247035))))

(declare-fun mapValue!17562 () ValueCell!4970)

(declare-fun mapRest!17562 () (Array (_ BitVec 32) ValueCell!4970))

(declare-fun mapKey!17562 () (_ BitVec 32))

(assert (=> mapNonEmpty!17562 (= (arr!12003 _values!549) (store mapRest!17562 mapKey!17562 mapValue!17562))))

(declare-fun b!413119 () Bool)

(declare-fun res!240083 () Bool)

(assert (=> b!413119 (=> (not res!240083) (not e!247033))))

(assert (=> b!413119 (= res!240083 (or (= (select (arr!12002 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12002 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!413120 () Bool)

(declare-fun res!240073 () Bool)

(assert (=> b!413120 (=> (not res!240073) (not e!247033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413120 (= res!240073 (validKeyInArray!0 k0!794))))

(declare-fun b!413121 () Bool)

(assert (=> b!413121 (= e!247035 tp_is_empty!10627)))

(declare-fun b!413122 () Bool)

(declare-fun res!240076 () Bool)

(assert (=> b!413122 (=> (not res!240076) (not e!247033))))

(declare-fun arrayContainsKey!0 (array!25105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413122 (= res!240076 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413123 () Bool)

(declare-fun res!240078 () Bool)

(assert (=> b!413123 (=> (not res!240078) (not e!247033))))

(declare-datatypes ((List!6961 0))(
  ( (Nil!6958) (Cons!6957 (h!7813 (_ BitVec 64)) (t!12126 List!6961)) )
))
(declare-fun arrayNoDuplicates!0 (array!25105 (_ BitVec 32) List!6961) Bool)

(assert (=> b!413123 (= res!240078 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6958))))

(declare-fun b!413124 () Bool)

(declare-fun res!240080 () Bool)

(assert (=> b!413124 (=> (not res!240080) (not e!247036))))

(assert (=> b!413124 (= res!240080 (arrayNoDuplicates!0 lt!189475 #b00000000000000000000000000000000 Nil!6958))))

(declare-fun bm!28576 () Bool)

(assert (=> bm!28576 (= call!28579 (getCurrentListMapNoExtraKeys!1152 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413125 () Bool)

(declare-fun res!240074 () Bool)

(assert (=> b!413125 (=> (not res!240074) (not e!247033))))

(assert (=> b!413125 (= res!240074 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12355 _keys!709))))))

(declare-fun res!240075 () Bool)

(assert (=> start!39194 (=> (not res!240075) (not e!247033))))

(assert (=> start!39194 (= res!240075 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12355 _keys!709))))))

(assert (=> start!39194 e!247033))

(assert (=> start!39194 tp_is_empty!10627))

(assert (=> start!39194 tp!33953))

(assert (=> start!39194 true))

(declare-fun array_inv!8810 (array!25107) Bool)

(assert (=> start!39194 (and (array_inv!8810 _values!549) e!247032)))

(declare-fun array_inv!8811 (array!25105) Bool)

(assert (=> start!39194 (array_inv!8811 _keys!709)))

(declare-fun bm!28575 () Bool)

(assert (=> bm!28575 (= call!28578 (getCurrentListMapNoExtraKeys!1152 lt!189475 lt!189479 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39194 res!240075) b!413116))

(assert (= (and b!413116 res!240081) b!413110))

(assert (= (and b!413110 res!240072) b!413111))

(assert (= (and b!413111 res!240082) b!413123))

(assert (= (and b!413123 res!240078) b!413125))

(assert (= (and b!413125 res!240074) b!413120))

(assert (= (and b!413120 res!240073) b!413119))

(assert (= (and b!413119 res!240083) b!413122))

(assert (= (and b!413122 res!240076) b!413109))

(assert (= (and b!413109 res!240077) b!413124))

(assert (= (and b!413124 res!240080) b!413108))

(assert (= (and b!413108 res!240079) b!413112))

(assert (= (and b!413112 res!240084) b!413118))

(assert (= (and b!413118 c!54855) b!413114))

(assert (= (and b!413118 (not c!54855)) b!413113))

(assert (= (or b!413114 b!413113) bm!28575))

(assert (= (or b!413114 b!413113) bm!28576))

(assert (= (and b!413115 condMapEmpty!17562) mapIsEmpty!17562))

(assert (= (and b!413115 (not condMapEmpty!17562)) mapNonEmpty!17562))

(get-info :version)

(assert (= (and mapNonEmpty!17562 ((_ is ValueCellFull!4970) mapValue!17562)) b!413121))

(assert (= (and b!413115 ((_ is ValueCellFull!4970) mapDefault!17562)) b!413117))

(assert (= start!39194 b!413115))

(declare-fun m!402171 () Bool)

(assert (=> b!413118 m!402171))

(declare-fun m!402173 () Bool)

(assert (=> b!413111 m!402173))

(declare-fun m!402175 () Bool)

(assert (=> bm!28576 m!402175))

(declare-fun m!402177 () Bool)

(assert (=> b!413112 m!402177))

(declare-fun m!402179 () Bool)

(assert (=> b!413112 m!402179))

(declare-fun m!402181 () Bool)

(assert (=> b!413112 m!402181))

(declare-fun m!402183 () Bool)

(assert (=> start!39194 m!402183))

(declare-fun m!402185 () Bool)

(assert (=> start!39194 m!402185))

(declare-fun m!402187 () Bool)

(assert (=> b!413123 m!402187))

(declare-fun m!402189 () Bool)

(assert (=> mapNonEmpty!17562 m!402189))

(declare-fun m!402191 () Bool)

(assert (=> b!413122 m!402191))

(declare-fun m!402193 () Bool)

(assert (=> b!413109 m!402193))

(declare-fun m!402195 () Bool)

(assert (=> b!413109 m!402195))

(declare-fun m!402197 () Bool)

(assert (=> b!413120 m!402197))

(declare-fun m!402199 () Bool)

(assert (=> b!413119 m!402199))

(declare-fun m!402201 () Bool)

(assert (=> b!413116 m!402201))

(declare-fun m!402203 () Bool)

(assert (=> bm!28575 m!402203))

(declare-fun m!402205 () Bool)

(assert (=> b!413114 m!402205))

(declare-fun m!402207 () Bool)

(assert (=> b!413124 m!402207))

(check-sat (not start!39194) (not b!413111) (not bm!28576) (not b!413114) (not b!413120) (not mapNonEmpty!17562) (not b!413109) (not b!413116) tp_is_empty!10627 (not bm!28575) (not b!413118) (not b_next!9475) (not b!413112) (not b!413123) (not b!413124) (not b!413122) b_and!16835)
(check-sat b_and!16835 (not b_next!9475))
