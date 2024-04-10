; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38766 () Bool)

(assert start!38766)

(declare-fun b!404129 () Bool)

(declare-fun res!233005 () Bool)

(declare-fun e!243173 () Bool)

(assert (=> b!404129 (=> (not res!233005) (not e!243173))))

(declare-datatypes ((array!24267 0))(
  ( (array!24268 (arr!11583 (Array (_ BitVec 32) (_ BitVec 64))) (size!11935 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24267)

(declare-datatypes ((List!6747 0))(
  ( (Nil!6744) (Cons!6743 (h!7599 (_ BitVec 64)) (t!11921 List!6747)) )
))
(declare-fun arrayNoDuplicates!0 (array!24267 (_ BitVec 32) List!6747) Bool)

(assert (=> b!404129 (= res!233005 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6744))))

(declare-fun b!404130 () Bool)

(declare-fun res!233006 () Bool)

(assert (=> b!404130 (=> (not res!233006) (not e!243173))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404130 (= res!233006 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11935 _keys!709))))))

(declare-fun b!404131 () Bool)

(declare-fun e!243169 () Bool)

(declare-fun e!243170 () Bool)

(declare-fun mapRes!16899 () Bool)

(assert (=> b!404131 (= e!243169 (and e!243170 mapRes!16899))))

(declare-fun condMapEmpty!16899 () Bool)

(declare-datatypes ((V!14685 0))(
  ( (V!14686 (val!5137 Int)) )
))
(declare-datatypes ((ValueCell!4749 0))(
  ( (ValueCellFull!4749 (v!7384 V!14685)) (EmptyCell!4749) )
))
(declare-datatypes ((array!24269 0))(
  ( (array!24270 (arr!11584 (Array (_ BitVec 32) ValueCell!4749)) (size!11936 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24269)

(declare-fun mapDefault!16899 () ValueCell!4749)

(assert (=> b!404131 (= condMapEmpty!16899 (= (arr!11584 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4749)) mapDefault!16899)))))

(declare-fun b!404132 () Bool)

(declare-fun res!232998 () Bool)

(assert (=> b!404132 (=> (not res!232998) (not e!243173))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404132 (= res!232998 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16899 () Bool)

(assert (=> mapIsEmpty!16899 mapRes!16899))

(declare-fun b!404133 () Bool)

(declare-fun tp_is_empty!10185 () Bool)

(assert (=> b!404133 (= e!243170 tp_is_empty!10185)))

(declare-fun b!404134 () Bool)

(declare-fun res!233004 () Bool)

(assert (=> b!404134 (=> (not res!233004) (not e!243173))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!404134 (= res!233004 (and (= (size!11936 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11935 _keys!709) (size!11936 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404135 () Bool)

(declare-fun res!233002 () Bool)

(assert (=> b!404135 (=> (not res!233002) (not e!243173))))

(assert (=> b!404135 (= res!233002 (or (= (select (arr!11583 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11583 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404136 () Bool)

(declare-fun e!243171 () Bool)

(assert (=> b!404136 (= e!243173 e!243171)))

(declare-fun res!232999 () Bool)

(assert (=> b!404136 (=> (not res!232999) (not e!243171))))

(declare-fun lt!188134 () array!24267)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24267 (_ BitVec 32)) Bool)

(assert (=> b!404136 (= res!232999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188134 mask!1025))))

(assert (=> b!404136 (= lt!188134 (array!24268 (store (arr!11583 _keys!709) i!563 k0!794) (size!11935 _keys!709)))))

(declare-fun res!233003 () Bool)

(assert (=> start!38766 (=> (not res!233003) (not e!243173))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38766 (= res!233003 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11935 _keys!709))))))

(assert (=> start!38766 e!243173))

(assert (=> start!38766 true))

(declare-fun array_inv!8474 (array!24269) Bool)

(assert (=> start!38766 (and (array_inv!8474 _values!549) e!243169)))

(declare-fun array_inv!8475 (array!24267) Bool)

(assert (=> start!38766 (array_inv!8475 _keys!709)))

(declare-fun b!404137 () Bool)

(declare-fun res!233001 () Bool)

(assert (=> b!404137 (=> (not res!233001) (not e!243173))))

(assert (=> b!404137 (= res!233001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404138 () Bool)

(assert (=> b!404138 (= e!243171 false)))

(declare-fun lt!188135 () Bool)

(assert (=> b!404138 (= lt!188135 (arrayNoDuplicates!0 lt!188134 #b00000000000000000000000000000000 Nil!6744))))

(declare-fun mapNonEmpty!16899 () Bool)

(declare-fun tp!33018 () Bool)

(declare-fun e!243174 () Bool)

(assert (=> mapNonEmpty!16899 (= mapRes!16899 (and tp!33018 e!243174))))

(declare-fun mapKey!16899 () (_ BitVec 32))

(declare-fun mapRest!16899 () (Array (_ BitVec 32) ValueCell!4749))

(declare-fun mapValue!16899 () ValueCell!4749)

(assert (=> mapNonEmpty!16899 (= (arr!11584 _values!549) (store mapRest!16899 mapKey!16899 mapValue!16899))))

(declare-fun b!404139 () Bool)

(declare-fun res!233000 () Bool)

(assert (=> b!404139 (=> (not res!233000) (not e!243173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404139 (= res!233000 (validKeyInArray!0 k0!794))))

(declare-fun b!404140 () Bool)

(assert (=> b!404140 (= e!243174 tp_is_empty!10185)))

(declare-fun b!404141 () Bool)

(declare-fun res!233007 () Bool)

(assert (=> b!404141 (=> (not res!233007) (not e!243173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404141 (= res!233007 (validMask!0 mask!1025))))

(assert (= (and start!38766 res!233003) b!404141))

(assert (= (and b!404141 res!233007) b!404134))

(assert (= (and b!404134 res!233004) b!404137))

(assert (= (and b!404137 res!233001) b!404129))

(assert (= (and b!404129 res!233005) b!404130))

(assert (= (and b!404130 res!233006) b!404139))

(assert (= (and b!404139 res!233000) b!404135))

(assert (= (and b!404135 res!233002) b!404132))

(assert (= (and b!404132 res!232998) b!404136))

(assert (= (and b!404136 res!232999) b!404138))

(assert (= (and b!404131 condMapEmpty!16899) mapIsEmpty!16899))

(assert (= (and b!404131 (not condMapEmpty!16899)) mapNonEmpty!16899))

(get-info :version)

(assert (= (and mapNonEmpty!16899 ((_ is ValueCellFull!4749) mapValue!16899)) b!404140))

(assert (= (and b!404131 ((_ is ValueCellFull!4749) mapDefault!16899)) b!404133))

(assert (= start!38766 b!404131))

(declare-fun m!397087 () Bool)

(assert (=> b!404138 m!397087))

(declare-fun m!397089 () Bool)

(assert (=> mapNonEmpty!16899 m!397089))

(declare-fun m!397091 () Bool)

(assert (=> b!404129 m!397091))

(declare-fun m!397093 () Bool)

(assert (=> b!404137 m!397093))

(declare-fun m!397095 () Bool)

(assert (=> start!38766 m!397095))

(declare-fun m!397097 () Bool)

(assert (=> start!38766 m!397097))

(declare-fun m!397099 () Bool)

(assert (=> b!404139 m!397099))

(declare-fun m!397101 () Bool)

(assert (=> b!404135 m!397101))

(declare-fun m!397103 () Bool)

(assert (=> b!404136 m!397103))

(declare-fun m!397105 () Bool)

(assert (=> b!404136 m!397105))

(declare-fun m!397107 () Bool)

(assert (=> b!404141 m!397107))

(declare-fun m!397109 () Bool)

(assert (=> b!404132 m!397109))

(check-sat (not b!404137) (not b!404141) (not b!404132) (not b!404136) (not start!38766) (not b!404138) (not b!404129) tp_is_empty!10185 (not b!404139) (not mapNonEmpty!16899))
(check-sat)
