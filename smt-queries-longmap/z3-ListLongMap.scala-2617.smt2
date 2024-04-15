; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39506 () Bool)

(assert start!39506)

(declare-fun b_free!9787 () Bool)

(declare-fun b_next!9787 () Bool)

(assert (=> start!39506 (= b_free!9787 (not b_next!9787))))

(declare-fun tp!34889 () Bool)

(declare-fun b_and!17417 () Bool)

(assert (=> start!39506 (= tp!34889 b_and!17417)))

(declare-fun b!422183 () Bool)

(declare-fun res!246562 () Bool)

(declare-fun e!251171 () Bool)

(assert (=> b!422183 (=> (not res!246562) (not e!251171))))

(declare-datatypes ((array!25707 0))(
  ( (array!25708 (arr!12303 (Array (_ BitVec 32) (_ BitVec 64))) (size!12656 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25707)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422183 (= res!246562 (or (= (select (arr!12303 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12303 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422184 () Bool)

(declare-fun e!251169 () Bool)

(assert (=> b!422184 (= e!251169 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15691 0))(
  ( (V!15692 (val!5514 Int)) )
))
(declare-fun minValue!515 () V!15691)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5126 0))(
  ( (ValueCellFull!5126 (v!7755 V!15691)) (EmptyCell!5126) )
))
(declare-datatypes ((array!25709 0))(
  ( (array!25710 (arr!12304 (Array (_ BitVec 32) ValueCell!5126)) (size!12657 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25709)

(declare-fun zeroValue!515 () V!15691)

(declare-fun lt!193738 () array!25707)

(declare-fun v!412 () V!15691)

(declare-datatypes ((tuple2!7226 0))(
  ( (tuple2!7227 (_1!3624 (_ BitVec 64)) (_2!3624 V!15691)) )
))
(declare-datatypes ((List!7216 0))(
  ( (Nil!7213) (Cons!7212 (h!8068 tuple2!7226) (t!12651 List!7216)) )
))
(declare-datatypes ((ListLongMap!6129 0))(
  ( (ListLongMap!6130 (toList!3080 List!7216)) )
))
(declare-fun lt!193739 () ListLongMap!6129)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1288 (array!25707 array!25709 (_ BitVec 32) (_ BitVec 32) V!15691 V!15691 (_ BitVec 32) Int) ListLongMap!6129)

(assert (=> b!422184 (= lt!193739 (getCurrentListMapNoExtraKeys!1288 lt!193738 (array!25710 (store (arr!12304 _values!549) i!563 (ValueCellFull!5126 v!412)) (size!12657 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193737 () ListLongMap!6129)

(assert (=> b!422184 (= lt!193737 (getCurrentListMapNoExtraKeys!1288 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422185 () Bool)

(declare-fun res!246567 () Bool)

(assert (=> b!422185 (=> (not res!246567) (not e!251171))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422185 (= res!246567 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18030 () Bool)

(declare-fun mapRes!18030 () Bool)

(assert (=> mapIsEmpty!18030 mapRes!18030))

(declare-fun mapNonEmpty!18030 () Bool)

(declare-fun tp!34890 () Bool)

(declare-fun e!251168 () Bool)

(assert (=> mapNonEmpty!18030 (= mapRes!18030 (and tp!34890 e!251168))))

(declare-fun mapValue!18030 () ValueCell!5126)

(declare-fun mapRest!18030 () (Array (_ BitVec 32) ValueCell!5126))

(declare-fun mapKey!18030 () (_ BitVec 32))

(assert (=> mapNonEmpty!18030 (= (arr!12304 _values!549) (store mapRest!18030 mapKey!18030 mapValue!18030))))

(declare-fun b!422186 () Bool)

(declare-fun tp_is_empty!10939 () Bool)

(assert (=> b!422186 (= e!251168 tp_is_empty!10939)))

(declare-fun b!422187 () Bool)

(declare-fun e!251172 () Bool)

(declare-fun e!251170 () Bool)

(assert (=> b!422187 (= e!251172 (and e!251170 mapRes!18030))))

(declare-fun condMapEmpty!18030 () Bool)

(declare-fun mapDefault!18030 () ValueCell!5126)

(assert (=> b!422187 (= condMapEmpty!18030 (= (arr!12304 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5126)) mapDefault!18030)))))

(declare-fun res!246566 () Bool)

(assert (=> start!39506 (=> (not res!246566) (not e!251171))))

(assert (=> start!39506 (= res!246566 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12656 _keys!709))))))

(assert (=> start!39506 e!251171))

(assert (=> start!39506 tp_is_empty!10939))

(assert (=> start!39506 tp!34889))

(assert (=> start!39506 true))

(declare-fun array_inv!9004 (array!25709) Bool)

(assert (=> start!39506 (and (array_inv!9004 _values!549) e!251172)))

(declare-fun array_inv!9005 (array!25707) Bool)

(assert (=> start!39506 (array_inv!9005 _keys!709)))

(declare-fun b!422188 () Bool)

(assert (=> b!422188 (= e!251170 tp_is_empty!10939)))

(declare-fun b!422189 () Bool)

(declare-fun res!246565 () Bool)

(assert (=> b!422189 (=> (not res!246565) (not e!251171))))

(assert (=> b!422189 (= res!246565 (and (= (size!12657 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12656 _keys!709) (size!12657 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422190 () Bool)

(declare-fun res!246564 () Bool)

(assert (=> b!422190 (=> (not res!246564) (not e!251171))))

(declare-fun arrayContainsKey!0 (array!25707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422190 (= res!246564 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422191 () Bool)

(declare-fun res!246563 () Bool)

(assert (=> b!422191 (=> (not res!246563) (not e!251169))))

(declare-datatypes ((List!7217 0))(
  ( (Nil!7214) (Cons!7213 (h!8069 (_ BitVec 64)) (t!12652 List!7217)) )
))
(declare-fun arrayNoDuplicates!0 (array!25707 (_ BitVec 32) List!7217) Bool)

(assert (=> b!422191 (= res!246563 (arrayNoDuplicates!0 lt!193738 #b00000000000000000000000000000000 Nil!7214))))

(declare-fun b!422192 () Bool)

(declare-fun res!246570 () Bool)

(assert (=> b!422192 (=> (not res!246570) (not e!251171))))

(assert (=> b!422192 (= res!246570 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12656 _keys!709))))))

(declare-fun b!422193 () Bool)

(declare-fun res!246560 () Bool)

(assert (=> b!422193 (=> (not res!246560) (not e!251171))))

(assert (=> b!422193 (= res!246560 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7214))))

(declare-fun b!422194 () Bool)

(assert (=> b!422194 (= e!251171 e!251169)))

(declare-fun res!246568 () Bool)

(assert (=> b!422194 (=> (not res!246568) (not e!251169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25707 (_ BitVec 32)) Bool)

(assert (=> b!422194 (= res!246568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193738 mask!1025))))

(assert (=> b!422194 (= lt!193738 (array!25708 (store (arr!12303 _keys!709) i!563 k0!794) (size!12656 _keys!709)))))

(declare-fun b!422195 () Bool)

(declare-fun res!246559 () Bool)

(assert (=> b!422195 (=> (not res!246559) (not e!251171))))

(assert (=> b!422195 (= res!246559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422196 () Bool)

(declare-fun res!246569 () Bool)

(assert (=> b!422196 (=> (not res!246569) (not e!251171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422196 (= res!246569 (validMask!0 mask!1025))))

(declare-fun b!422197 () Bool)

(declare-fun res!246561 () Bool)

(assert (=> b!422197 (=> (not res!246561) (not e!251169))))

(assert (=> b!422197 (= res!246561 (bvsle from!863 i!563))))

(assert (= (and start!39506 res!246566) b!422196))

(assert (= (and b!422196 res!246569) b!422189))

(assert (= (and b!422189 res!246565) b!422195))

(assert (= (and b!422195 res!246559) b!422193))

(assert (= (and b!422193 res!246560) b!422192))

(assert (= (and b!422192 res!246570) b!422185))

(assert (= (and b!422185 res!246567) b!422183))

(assert (= (and b!422183 res!246562) b!422190))

(assert (= (and b!422190 res!246564) b!422194))

(assert (= (and b!422194 res!246568) b!422191))

(assert (= (and b!422191 res!246563) b!422197))

(assert (= (and b!422197 res!246561) b!422184))

(assert (= (and b!422187 condMapEmpty!18030) mapIsEmpty!18030))

(assert (= (and b!422187 (not condMapEmpty!18030)) mapNonEmpty!18030))

(get-info :version)

(assert (= (and mapNonEmpty!18030 ((_ is ValueCellFull!5126) mapValue!18030)) b!422186))

(assert (= (and b!422187 ((_ is ValueCellFull!5126) mapDefault!18030)) b!422188))

(assert (= start!39506 b!422187))

(declare-fun m!411531 () Bool)

(assert (=> b!422194 m!411531))

(declare-fun m!411533 () Bool)

(assert (=> b!422194 m!411533))

(declare-fun m!411535 () Bool)

(assert (=> b!422183 m!411535))

(declare-fun m!411537 () Bool)

(assert (=> b!422190 m!411537))

(declare-fun m!411539 () Bool)

(assert (=> b!422195 m!411539))

(declare-fun m!411541 () Bool)

(assert (=> b!422184 m!411541))

(declare-fun m!411543 () Bool)

(assert (=> b!422184 m!411543))

(declare-fun m!411545 () Bool)

(assert (=> b!422184 m!411545))

(declare-fun m!411547 () Bool)

(assert (=> start!39506 m!411547))

(declare-fun m!411549 () Bool)

(assert (=> start!39506 m!411549))

(declare-fun m!411551 () Bool)

(assert (=> b!422191 m!411551))

(declare-fun m!411553 () Bool)

(assert (=> mapNonEmpty!18030 m!411553))

(declare-fun m!411555 () Bool)

(assert (=> b!422193 m!411555))

(declare-fun m!411557 () Bool)

(assert (=> b!422196 m!411557))

(declare-fun m!411559 () Bool)

(assert (=> b!422185 m!411559))

(check-sat (not b!422185) (not start!39506) (not b!422191) (not b_next!9787) (not b!422194) (not mapNonEmpty!18030) (not b!422193) (not b!422196) tp_is_empty!10939 (not b!422184) (not b!422190) b_and!17417 (not b!422195))
(check-sat b_and!17417 (not b_next!9787))
