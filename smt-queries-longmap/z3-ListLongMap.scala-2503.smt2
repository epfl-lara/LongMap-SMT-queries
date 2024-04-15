; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38822 () Bool)

(assert start!38822)

(declare-fun b!405223 () Bool)

(declare-fun res!233920 () Bool)

(declare-fun e!243627 () Bool)

(assert (=> b!405223 (=> (not res!233920) (not e!243627))))

(declare-datatypes ((array!24385 0))(
  ( (array!24386 (arr!11642 (Array (_ BitVec 32) (_ BitVec 64))) (size!11995 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24385)

(declare-datatypes ((List!6746 0))(
  ( (Nil!6743) (Cons!6742 (h!7598 (_ BitVec 64)) (t!11911 List!6746)) )
))
(declare-fun arrayNoDuplicates!0 (array!24385 (_ BitVec 32) List!6746) Bool)

(assert (=> b!405223 (= res!233920 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6743))))

(declare-fun b!405224 () Bool)

(declare-fun e!243630 () Bool)

(declare-fun e!243626 () Bool)

(declare-fun mapRes!17004 () Bool)

(assert (=> b!405224 (= e!243630 (and e!243626 mapRes!17004))))

(declare-fun condMapEmpty!17004 () Bool)

(declare-datatypes ((V!14779 0))(
  ( (V!14780 (val!5172 Int)) )
))
(declare-datatypes ((ValueCell!4784 0))(
  ( (ValueCellFull!4784 (v!7413 V!14779)) (EmptyCell!4784) )
))
(declare-datatypes ((array!24387 0))(
  ( (array!24388 (arr!11643 (Array (_ BitVec 32) ValueCell!4784)) (size!11996 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24387)

(declare-fun mapDefault!17004 () ValueCell!4784)

(assert (=> b!405224 (= condMapEmpty!17004 (= (arr!11643 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4784)) mapDefault!17004)))))

(declare-fun b!405225 () Bool)

(declare-fun e!243625 () Bool)

(assert (=> b!405225 (= e!243625 false)))

(declare-fun lt!188110 () Bool)

(declare-fun lt!188111 () array!24385)

(assert (=> b!405225 (= lt!188110 (arrayNoDuplicates!0 lt!188111 #b00000000000000000000000000000000 Nil!6743))))

(declare-fun mapIsEmpty!17004 () Bool)

(assert (=> mapIsEmpty!17004 mapRes!17004))

(declare-fun b!405227 () Bool)

(declare-fun res!233928 () Bool)

(assert (=> b!405227 (=> (not res!233928) (not e!243627))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405227 (= res!233928 (or (= (select (arr!11642 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11642 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405228 () Bool)

(declare-fun res!233919 () Bool)

(assert (=> b!405228 (=> (not res!233919) (not e!243627))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24385 (_ BitVec 32)) Bool)

(assert (=> b!405228 (= res!233919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405229 () Bool)

(declare-fun res!233924 () Bool)

(assert (=> b!405229 (=> (not res!233924) (not e!243627))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405229 (= res!233924 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!233927 () Bool)

(assert (=> start!38822 (=> (not res!233927) (not e!243627))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38822 (= res!233927 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11995 _keys!709))))))

(assert (=> start!38822 e!243627))

(assert (=> start!38822 true))

(declare-fun array_inv!8542 (array!24387) Bool)

(assert (=> start!38822 (and (array_inv!8542 _values!549) e!243630)))

(declare-fun array_inv!8543 (array!24385) Bool)

(assert (=> start!38822 (array_inv!8543 _keys!709)))

(declare-fun b!405226 () Bool)

(declare-fun res!233922 () Bool)

(assert (=> b!405226 (=> (not res!233922) (not e!243627))))

(assert (=> b!405226 (= res!233922 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11995 _keys!709))))))

(declare-fun b!405230 () Bool)

(declare-fun e!243628 () Bool)

(declare-fun tp_is_empty!10255 () Bool)

(assert (=> b!405230 (= e!243628 tp_is_empty!10255)))

(declare-fun b!405231 () Bool)

(declare-fun res!233926 () Bool)

(assert (=> b!405231 (=> (not res!233926) (not e!243627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405231 (= res!233926 (validMask!0 mask!1025))))

(declare-fun b!405232 () Bool)

(assert (=> b!405232 (= e!243627 e!243625)))

(declare-fun res!233925 () Bool)

(assert (=> b!405232 (=> (not res!233925) (not e!243625))))

(assert (=> b!405232 (= res!233925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188111 mask!1025))))

(assert (=> b!405232 (= lt!188111 (array!24386 (store (arr!11642 _keys!709) i!563 k0!794) (size!11995 _keys!709)))))

(declare-fun b!405233 () Bool)

(assert (=> b!405233 (= e!243626 tp_is_empty!10255)))

(declare-fun b!405234 () Bool)

(declare-fun res!233923 () Bool)

(assert (=> b!405234 (=> (not res!233923) (not e!243627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405234 (= res!233923 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!17004 () Bool)

(declare-fun tp!33123 () Bool)

(assert (=> mapNonEmpty!17004 (= mapRes!17004 (and tp!33123 e!243628))))

(declare-fun mapValue!17004 () ValueCell!4784)

(declare-fun mapKey!17004 () (_ BitVec 32))

(declare-fun mapRest!17004 () (Array (_ BitVec 32) ValueCell!4784))

(assert (=> mapNonEmpty!17004 (= (arr!11643 _values!549) (store mapRest!17004 mapKey!17004 mapValue!17004))))

(declare-fun b!405235 () Bool)

(declare-fun res!233921 () Bool)

(assert (=> b!405235 (=> (not res!233921) (not e!243627))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405235 (= res!233921 (and (= (size!11996 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11995 _keys!709) (size!11996 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38822 res!233927) b!405231))

(assert (= (and b!405231 res!233926) b!405235))

(assert (= (and b!405235 res!233921) b!405228))

(assert (= (and b!405228 res!233919) b!405223))

(assert (= (and b!405223 res!233920) b!405226))

(assert (= (and b!405226 res!233922) b!405234))

(assert (= (and b!405234 res!233923) b!405227))

(assert (= (and b!405227 res!233928) b!405229))

(assert (= (and b!405229 res!233924) b!405232))

(assert (= (and b!405232 res!233925) b!405225))

(assert (= (and b!405224 condMapEmpty!17004) mapIsEmpty!17004))

(assert (= (and b!405224 (not condMapEmpty!17004)) mapNonEmpty!17004))

(get-info :version)

(assert (= (and mapNonEmpty!17004 ((_ is ValueCellFull!4784) mapValue!17004)) b!405230))

(assert (= (and b!405224 ((_ is ValueCellFull!4784) mapDefault!17004)) b!405233))

(assert (= start!38822 b!405224))

(declare-fun m!397203 () Bool)

(assert (=> b!405234 m!397203))

(declare-fun m!397205 () Bool)

(assert (=> start!38822 m!397205))

(declare-fun m!397207 () Bool)

(assert (=> start!38822 m!397207))

(declare-fun m!397209 () Bool)

(assert (=> b!405228 m!397209))

(declare-fun m!397211 () Bool)

(assert (=> b!405229 m!397211))

(declare-fun m!397213 () Bool)

(assert (=> b!405225 m!397213))

(declare-fun m!397215 () Bool)

(assert (=> mapNonEmpty!17004 m!397215))

(declare-fun m!397217 () Bool)

(assert (=> b!405232 m!397217))

(declare-fun m!397219 () Bool)

(assert (=> b!405232 m!397219))

(declare-fun m!397221 () Bool)

(assert (=> b!405231 m!397221))

(declare-fun m!397223 () Bool)

(assert (=> b!405227 m!397223))

(declare-fun m!397225 () Bool)

(assert (=> b!405223 m!397225))

(check-sat (not start!38822) (not b!405225) (not b!405229) (not b!405234) (not mapNonEmpty!17004) (not b!405231) (not b!405232) tp_is_empty!10255 (not b!405228) (not b!405223))
(check-sat)
