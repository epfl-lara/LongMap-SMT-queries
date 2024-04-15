; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38744 () Bool)

(assert start!38744)

(declare-fun b!403702 () Bool)

(declare-fun res!232750 () Bool)

(declare-fun e!242924 () Bool)

(assert (=> b!403702 (=> (not res!232750) (not e!242924))))

(declare-datatypes ((array!24235 0))(
  ( (array!24236 (arr!11567 (Array (_ BitVec 32) (_ BitVec 64))) (size!11920 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24235)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403702 (= res!232750 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!403703 () Bool)

(declare-fun res!232755 () Bool)

(assert (=> b!403703 (=> (not res!232755) (not e!242924))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14675 0))(
  ( (V!14676 (val!5133 Int)) )
))
(declare-datatypes ((ValueCell!4745 0))(
  ( (ValueCellFull!4745 (v!7374 V!14675)) (EmptyCell!4745) )
))
(declare-datatypes ((array!24237 0))(
  ( (array!24238 (arr!11568 (Array (_ BitVec 32) ValueCell!4745)) (size!11921 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24237)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!403703 (= res!232755 (and (= (size!11921 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11920 _keys!709) (size!11921 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403704 () Bool)

(declare-fun res!232758 () Bool)

(assert (=> b!403704 (=> (not res!232758) (not e!242924))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403704 (= res!232758 (or (= (select (arr!11567 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11567 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403705 () Bool)

(declare-fun e!242928 () Bool)

(declare-fun tp_is_empty!10177 () Bool)

(assert (=> b!403705 (= e!242928 tp_is_empty!10177)))

(declare-fun mapIsEmpty!16887 () Bool)

(declare-fun mapRes!16887 () Bool)

(assert (=> mapIsEmpty!16887 mapRes!16887))

(declare-fun b!403706 () Bool)

(declare-fun e!242923 () Bool)

(assert (=> b!403706 (= e!242924 e!242923)))

(declare-fun res!232754 () Bool)

(assert (=> b!403706 (=> (not res!232754) (not e!242923))))

(declare-fun lt!187877 () array!24235)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24235 (_ BitVec 32)) Bool)

(assert (=> b!403706 (= res!232754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187877 mask!1025))))

(assert (=> b!403706 (= lt!187877 (array!24236 (store (arr!11567 _keys!709) i!563 k0!794) (size!11920 _keys!709)))))

(declare-fun b!403707 () Bool)

(declare-fun res!232751 () Bool)

(assert (=> b!403707 (=> (not res!232751) (not e!242924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403707 (= res!232751 (validKeyInArray!0 k0!794))))

(declare-fun res!232749 () Bool)

(assert (=> start!38744 (=> (not res!232749) (not e!242924))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38744 (= res!232749 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11920 _keys!709))))))

(assert (=> start!38744 e!242924))

(assert (=> start!38744 true))

(declare-fun e!242926 () Bool)

(declare-fun array_inv!8486 (array!24237) Bool)

(assert (=> start!38744 (and (array_inv!8486 _values!549) e!242926)))

(declare-fun array_inv!8487 (array!24235) Bool)

(assert (=> start!38744 (array_inv!8487 _keys!709)))

(declare-fun b!403708 () Bool)

(declare-fun e!242927 () Bool)

(assert (=> b!403708 (= e!242927 tp_is_empty!10177)))

(declare-fun b!403709 () Bool)

(declare-fun res!232753 () Bool)

(assert (=> b!403709 (=> (not res!232753) (not e!242924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403709 (= res!232753 (validMask!0 mask!1025))))

(declare-fun b!403710 () Bool)

(declare-fun res!232756 () Bool)

(assert (=> b!403710 (=> (not res!232756) (not e!242924))))

(assert (=> b!403710 (= res!232756 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11920 _keys!709))))))

(declare-fun b!403711 () Bool)

(assert (=> b!403711 (= e!242926 (and e!242927 mapRes!16887))))

(declare-fun condMapEmpty!16887 () Bool)

(declare-fun mapDefault!16887 () ValueCell!4745)

(assert (=> b!403711 (= condMapEmpty!16887 (= (arr!11568 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4745)) mapDefault!16887)))))

(declare-fun b!403712 () Bool)

(assert (=> b!403712 (= e!242923 false)))

(declare-fun lt!187876 () Bool)

(declare-datatypes ((List!6716 0))(
  ( (Nil!6713) (Cons!6712 (h!7568 (_ BitVec 64)) (t!11881 List!6716)) )
))
(declare-fun arrayNoDuplicates!0 (array!24235 (_ BitVec 32) List!6716) Bool)

(assert (=> b!403712 (= lt!187876 (arrayNoDuplicates!0 lt!187877 #b00000000000000000000000000000000 Nil!6713))))

(declare-fun b!403713 () Bool)

(declare-fun res!232757 () Bool)

(assert (=> b!403713 (=> (not res!232757) (not e!242924))))

(assert (=> b!403713 (= res!232757 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6713))))

(declare-fun b!403714 () Bool)

(declare-fun res!232752 () Bool)

(assert (=> b!403714 (=> (not res!232752) (not e!242924))))

(assert (=> b!403714 (= res!232752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16887 () Bool)

(declare-fun tp!33006 () Bool)

(assert (=> mapNonEmpty!16887 (= mapRes!16887 (and tp!33006 e!242928))))

(declare-fun mapKey!16887 () (_ BitVec 32))

(declare-fun mapRest!16887 () (Array (_ BitVec 32) ValueCell!4745))

(declare-fun mapValue!16887 () ValueCell!4745)

(assert (=> mapNonEmpty!16887 (= (arr!11568 _values!549) (store mapRest!16887 mapKey!16887 mapValue!16887))))

(assert (= (and start!38744 res!232749) b!403709))

(assert (= (and b!403709 res!232753) b!403703))

(assert (= (and b!403703 res!232755) b!403714))

(assert (= (and b!403714 res!232752) b!403713))

(assert (= (and b!403713 res!232757) b!403710))

(assert (= (and b!403710 res!232756) b!403707))

(assert (= (and b!403707 res!232751) b!403704))

(assert (= (and b!403704 res!232758) b!403702))

(assert (= (and b!403702 res!232750) b!403706))

(assert (= (and b!403706 res!232754) b!403712))

(assert (= (and b!403711 condMapEmpty!16887) mapIsEmpty!16887))

(assert (= (and b!403711 (not condMapEmpty!16887)) mapNonEmpty!16887))

(get-info :version)

(assert (= (and mapNonEmpty!16887 ((_ is ValueCellFull!4745) mapValue!16887)) b!403705))

(assert (= (and b!403711 ((_ is ValueCellFull!4745) mapDefault!16887)) b!403708))

(assert (= start!38744 b!403711))

(declare-fun m!396267 () Bool)

(assert (=> b!403702 m!396267))

(declare-fun m!396269 () Bool)

(assert (=> b!403714 m!396269))

(declare-fun m!396271 () Bool)

(assert (=> b!403707 m!396271))

(declare-fun m!396273 () Bool)

(assert (=> mapNonEmpty!16887 m!396273))

(declare-fun m!396275 () Bool)

(assert (=> b!403706 m!396275))

(declare-fun m!396277 () Bool)

(assert (=> b!403706 m!396277))

(declare-fun m!396279 () Bool)

(assert (=> b!403709 m!396279))

(declare-fun m!396281 () Bool)

(assert (=> b!403712 m!396281))

(declare-fun m!396283 () Bool)

(assert (=> start!38744 m!396283))

(declare-fun m!396285 () Bool)

(assert (=> start!38744 m!396285))

(declare-fun m!396287 () Bool)

(assert (=> b!403713 m!396287))

(declare-fun m!396289 () Bool)

(assert (=> b!403704 m!396289))

(check-sat tp_is_empty!10177 (not b!403706) (not b!403709) (not b!403712) (not b!403707) (not b!403713) (not b!403714) (not start!38744) (not b!403702) (not mapNonEmpty!16887))
(check-sat)
