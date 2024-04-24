; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39008 () Bool)

(assert start!39008)

(declare-fun b!409073 () Bool)

(declare-fun res!236836 () Bool)

(declare-fun e!245443 () Bool)

(assert (=> b!409073 (=> (not res!236836) (not e!245443))))

(declare-datatypes ((array!24754 0))(
  ( (array!24755 (arr!11826 (Array (_ BitVec 32) (_ BitVec 64))) (size!12178 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24754)

(declare-datatypes ((List!6719 0))(
  ( (Nil!6716) (Cons!6715 (h!7571 (_ BitVec 64)) (t!11885 List!6719)) )
))
(declare-fun arrayNoDuplicates!0 (array!24754 (_ BitVec 32) List!6719) Bool)

(assert (=> b!409073 (= res!236836 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6716))))

(declare-fun b!409074 () Bool)

(declare-fun e!245446 () Bool)

(declare-fun e!245441 () Bool)

(declare-fun mapRes!17283 () Bool)

(assert (=> b!409074 (= e!245446 (and e!245441 mapRes!17283))))

(declare-fun condMapEmpty!17283 () Bool)

(declare-datatypes ((V!15027 0))(
  ( (V!15028 (val!5265 Int)) )
))
(declare-datatypes ((ValueCell!4877 0))(
  ( (ValueCellFull!4877 (v!7513 V!15027)) (EmptyCell!4877) )
))
(declare-datatypes ((array!24756 0))(
  ( (array!24757 (arr!11827 (Array (_ BitVec 32) ValueCell!4877)) (size!12179 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24756)

(declare-fun mapDefault!17283 () ValueCell!4877)

(assert (=> b!409074 (= condMapEmpty!17283 (= (arr!11827 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4877)) mapDefault!17283)))))

(declare-fun b!409075 () Bool)

(declare-fun res!236839 () Bool)

(assert (=> b!409075 (=> (not res!236839) (not e!245443))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24754 (_ BitVec 32)) Bool)

(assert (=> b!409075 (= res!236839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409076 () Bool)

(declare-fun e!245444 () Bool)

(declare-fun tp_is_empty!10441 () Bool)

(assert (=> b!409076 (= e!245444 tp_is_empty!10441)))

(declare-fun b!409077 () Bool)

(declare-fun res!236844 () Bool)

(assert (=> b!409077 (=> (not res!236844) (not e!245443))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!409077 (= res!236844 (and (= (size!12179 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12178 _keys!709) (size!12179 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409078 () Bool)

(declare-fun e!245442 () Bool)

(assert (=> b!409078 (= e!245442 false)))

(declare-fun lt!188921 () Bool)

(declare-fun lt!188922 () array!24754)

(assert (=> b!409078 (= lt!188921 (arrayNoDuplicates!0 lt!188922 #b00000000000000000000000000000000 Nil!6716))))

(declare-fun mapNonEmpty!17283 () Bool)

(declare-fun tp!33402 () Bool)

(assert (=> mapNonEmpty!17283 (= mapRes!17283 (and tp!33402 e!245444))))

(declare-fun mapValue!17283 () ValueCell!4877)

(declare-fun mapKey!17283 () (_ BitVec 32))

(declare-fun mapRest!17283 () (Array (_ BitVec 32) ValueCell!4877))

(assert (=> mapNonEmpty!17283 (= (arr!11827 _values!549) (store mapRest!17283 mapKey!17283 mapValue!17283))))

(declare-fun b!409079 () Bool)

(assert (=> b!409079 (= e!245443 e!245442)))

(declare-fun res!236842 () Bool)

(assert (=> b!409079 (=> (not res!236842) (not e!245442))))

(assert (=> b!409079 (= res!236842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188922 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409079 (= lt!188922 (array!24755 (store (arr!11826 _keys!709) i!563 k0!794) (size!12178 _keys!709)))))

(declare-fun b!409080 () Bool)

(declare-fun res!236838 () Bool)

(assert (=> b!409080 (=> (not res!236838) (not e!245443))))

(assert (=> b!409080 (= res!236838 (or (= (select (arr!11826 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11826 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409081 () Bool)

(declare-fun res!236843 () Bool)

(assert (=> b!409081 (=> (not res!236843) (not e!245443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409081 (= res!236843 (validMask!0 mask!1025))))

(declare-fun res!236837 () Bool)

(assert (=> start!39008 (=> (not res!236837) (not e!245443))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39008 (= res!236837 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12178 _keys!709))))))

(assert (=> start!39008 e!245443))

(assert (=> start!39008 true))

(declare-fun array_inv!8714 (array!24756) Bool)

(assert (=> start!39008 (and (array_inv!8714 _values!549) e!245446)))

(declare-fun array_inv!8715 (array!24754) Bool)

(assert (=> start!39008 (array_inv!8715 _keys!709)))

(declare-fun b!409072 () Bool)

(declare-fun res!236841 () Bool)

(assert (=> b!409072 (=> (not res!236841) (not e!245443))))

(declare-fun arrayContainsKey!0 (array!24754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409072 (= res!236841 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409082 () Bool)

(declare-fun res!236835 () Bool)

(assert (=> b!409082 (=> (not res!236835) (not e!245443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409082 (= res!236835 (validKeyInArray!0 k0!794))))

(declare-fun b!409083 () Bool)

(assert (=> b!409083 (= e!245441 tp_is_empty!10441)))

(declare-fun mapIsEmpty!17283 () Bool)

(assert (=> mapIsEmpty!17283 mapRes!17283))

(declare-fun b!409084 () Bool)

(declare-fun res!236840 () Bool)

(assert (=> b!409084 (=> (not res!236840) (not e!245443))))

(assert (=> b!409084 (= res!236840 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12178 _keys!709))))))

(assert (= (and start!39008 res!236837) b!409081))

(assert (= (and b!409081 res!236843) b!409077))

(assert (= (and b!409077 res!236844) b!409075))

(assert (= (and b!409075 res!236839) b!409073))

(assert (= (and b!409073 res!236836) b!409084))

(assert (= (and b!409084 res!236840) b!409082))

(assert (= (and b!409082 res!236835) b!409080))

(assert (= (and b!409080 res!236838) b!409072))

(assert (= (and b!409072 res!236841) b!409079))

(assert (= (and b!409079 res!236842) b!409078))

(assert (= (and b!409074 condMapEmpty!17283) mapIsEmpty!17283))

(assert (= (and b!409074 (not condMapEmpty!17283)) mapNonEmpty!17283))

(get-info :version)

(assert (= (and mapNonEmpty!17283 ((_ is ValueCellFull!4877) mapValue!17283)) b!409076))

(assert (= (and b!409074 ((_ is ValueCellFull!4877) mapDefault!17283)) b!409083))

(assert (= start!39008 b!409074))

(declare-fun m!400389 () Bool)

(assert (=> start!39008 m!400389))

(declare-fun m!400391 () Bool)

(assert (=> start!39008 m!400391))

(declare-fun m!400393 () Bool)

(assert (=> b!409081 m!400393))

(declare-fun m!400395 () Bool)

(assert (=> b!409078 m!400395))

(declare-fun m!400397 () Bool)

(assert (=> b!409080 m!400397))

(declare-fun m!400399 () Bool)

(assert (=> b!409079 m!400399))

(declare-fun m!400401 () Bool)

(assert (=> b!409079 m!400401))

(declare-fun m!400403 () Bool)

(assert (=> b!409072 m!400403))

(declare-fun m!400405 () Bool)

(assert (=> b!409082 m!400405))

(declare-fun m!400407 () Bool)

(assert (=> b!409075 m!400407))

(declare-fun m!400409 () Bool)

(assert (=> b!409073 m!400409))

(declare-fun m!400411 () Bool)

(assert (=> mapNonEmpty!17283 m!400411))

(check-sat (not b!409082) (not start!39008) (not b!409078) (not b!409075) (not b!409072) tp_is_empty!10441 (not b!409079) (not mapNonEmpty!17283) (not b!409081) (not b!409073))
(check-sat)
