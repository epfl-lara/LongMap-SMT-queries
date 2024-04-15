; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39152 () Bool)

(assert start!39152)

(declare-fun b_free!9433 () Bool)

(declare-fun b_next!9433 () Bool)

(assert (=> start!39152 (= b_free!9433 (not b_next!9433))))

(declare-fun tp!33827 () Bool)

(declare-fun b_and!16793 () Bool)

(assert (=> start!39152 (= tp!33827 b_and!16793)))

(declare-fun b!412076 () Bool)

(declare-fun res!239289 () Bool)

(declare-fun e!246596 () Bool)

(assert (=> b!412076 (=> (not res!239289) (not e!246596))))

(declare-datatypes ((array!25021 0))(
  ( (array!25022 (arr!11960 (Array (_ BitVec 32) (_ BitVec 64))) (size!12313 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25021)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15219 0))(
  ( (V!15220 (val!5337 Int)) )
))
(declare-datatypes ((ValueCell!4949 0))(
  ( (ValueCellFull!4949 (v!7578 V!15219)) (EmptyCell!4949) )
))
(declare-datatypes ((array!25023 0))(
  ( (array!25024 (arr!11961 (Array (_ BitVec 32) ValueCell!4949)) (size!12314 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25023)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!412076 (= res!239289 (and (= (size!12314 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12313 _keys!709) (size!12314 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412077 () Bool)

(declare-fun e!246598 () Bool)

(assert (=> b!412077 (= e!246596 e!246598)))

(declare-fun res!239292 () Bool)

(assert (=> b!412077 (=> (not res!239292) (not e!246598))))

(declare-fun lt!189230 () array!25021)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25021 (_ BitVec 32)) Bool)

(assert (=> b!412077 (= res!239292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189230 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412077 (= lt!189230 (array!25022 (store (arr!11960 _keys!709) i!563 k0!794) (size!12313 _keys!709)))))

(declare-fun b!412078 () Bool)

(declare-fun res!239293 () Bool)

(assert (=> b!412078 (=> (not res!239293) (not e!246596))))

(declare-fun arrayContainsKey!0 (array!25021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412078 (= res!239293 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412079 () Bool)

(declare-fun res!239287 () Bool)

(assert (=> b!412079 (=> (not res!239287) (not e!246596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412079 (= res!239287 (validMask!0 mask!1025))))

(declare-fun b!412080 () Bool)

(assert (=> b!412080 (= e!246598 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15219)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15219)

(declare-fun v!412 () V!15219)

(declare-datatypes ((tuple2!6908 0))(
  ( (tuple2!6909 (_1!3465 (_ BitVec 64)) (_2!3465 V!15219)) )
))
(declare-datatypes ((List!6923 0))(
  ( (Nil!6920) (Cons!6919 (h!7775 tuple2!6908) (t!12088 List!6923)) )
))
(declare-datatypes ((ListLongMap!5811 0))(
  ( (ListLongMap!5812 (toList!2921 List!6923)) )
))
(declare-fun lt!189229 () ListLongMap!5811)

(declare-fun getCurrentListMapNoExtraKeys!1135 (array!25021 array!25023 (_ BitVec 32) (_ BitVec 32) V!15219 V!15219 (_ BitVec 32) Int) ListLongMap!5811)

(assert (=> b!412080 (= lt!189229 (getCurrentListMapNoExtraKeys!1135 lt!189230 (array!25024 (store (arr!11961 _values!549) i!563 (ValueCellFull!4949 v!412)) (size!12314 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189228 () ListLongMap!5811)

(assert (=> b!412080 (= lt!189228 (getCurrentListMapNoExtraKeys!1135 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412081 () Bool)

(declare-fun res!239288 () Bool)

(assert (=> b!412081 (=> (not res!239288) (not e!246596))))

(declare-datatypes ((List!6924 0))(
  ( (Nil!6921) (Cons!6920 (h!7776 (_ BitVec 64)) (t!12089 List!6924)) )
))
(declare-fun arrayNoDuplicates!0 (array!25021 (_ BitVec 32) List!6924) Bool)

(assert (=> b!412081 (= res!239288 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6921))))

(declare-fun b!412082 () Bool)

(declare-fun res!239298 () Bool)

(assert (=> b!412082 (=> (not res!239298) (not e!246596))))

(assert (=> b!412082 (= res!239298 (or (= (select (arr!11960 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11960 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17499 () Bool)

(declare-fun mapRes!17499 () Bool)

(assert (=> mapIsEmpty!17499 mapRes!17499))

(declare-fun res!239290 () Bool)

(assert (=> start!39152 (=> (not res!239290) (not e!246596))))

(assert (=> start!39152 (= res!239290 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12313 _keys!709))))))

(assert (=> start!39152 e!246596))

(declare-fun tp_is_empty!10585 () Bool)

(assert (=> start!39152 tp_is_empty!10585))

(assert (=> start!39152 tp!33827))

(assert (=> start!39152 true))

(declare-fun e!246599 () Bool)

(declare-fun array_inv!8776 (array!25023) Bool)

(assert (=> start!39152 (and (array_inv!8776 _values!549) e!246599)))

(declare-fun array_inv!8777 (array!25021) Bool)

(assert (=> start!39152 (array_inv!8777 _keys!709)))

(declare-fun b!412083 () Bool)

(declare-fun res!239291 () Bool)

(assert (=> b!412083 (=> (not res!239291) (not e!246596))))

(assert (=> b!412083 (= res!239291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412084 () Bool)

(declare-fun res!239297 () Bool)

(assert (=> b!412084 (=> (not res!239297) (not e!246596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412084 (= res!239297 (validKeyInArray!0 k0!794))))

(declare-fun b!412085 () Bool)

(declare-fun res!239295 () Bool)

(assert (=> b!412085 (=> (not res!239295) (not e!246596))))

(assert (=> b!412085 (= res!239295 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12313 _keys!709))))))

(declare-fun b!412086 () Bool)

(declare-fun e!246595 () Bool)

(assert (=> b!412086 (= e!246595 tp_is_empty!10585)))

(declare-fun b!412087 () Bool)

(declare-fun res!239296 () Bool)

(assert (=> b!412087 (=> (not res!239296) (not e!246598))))

(assert (=> b!412087 (= res!239296 (bvsle from!863 i!563))))

(declare-fun b!412088 () Bool)

(declare-fun e!246600 () Bool)

(assert (=> b!412088 (= e!246599 (and e!246600 mapRes!17499))))

(declare-fun condMapEmpty!17499 () Bool)

(declare-fun mapDefault!17499 () ValueCell!4949)

(assert (=> b!412088 (= condMapEmpty!17499 (= (arr!11961 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4949)) mapDefault!17499)))))

(declare-fun b!412089 () Bool)

(assert (=> b!412089 (= e!246600 tp_is_empty!10585)))

(declare-fun mapNonEmpty!17499 () Bool)

(declare-fun tp!33828 () Bool)

(assert (=> mapNonEmpty!17499 (= mapRes!17499 (and tp!33828 e!246595))))

(declare-fun mapValue!17499 () ValueCell!4949)

(declare-fun mapKey!17499 () (_ BitVec 32))

(declare-fun mapRest!17499 () (Array (_ BitVec 32) ValueCell!4949))

(assert (=> mapNonEmpty!17499 (= (arr!11961 _values!549) (store mapRest!17499 mapKey!17499 mapValue!17499))))

(declare-fun b!412090 () Bool)

(declare-fun res!239294 () Bool)

(assert (=> b!412090 (=> (not res!239294) (not e!246598))))

(assert (=> b!412090 (= res!239294 (arrayNoDuplicates!0 lt!189230 #b00000000000000000000000000000000 Nil!6921))))

(assert (= (and start!39152 res!239290) b!412079))

(assert (= (and b!412079 res!239287) b!412076))

(assert (= (and b!412076 res!239289) b!412083))

(assert (= (and b!412083 res!239291) b!412081))

(assert (= (and b!412081 res!239288) b!412085))

(assert (= (and b!412085 res!239295) b!412084))

(assert (= (and b!412084 res!239297) b!412082))

(assert (= (and b!412082 res!239298) b!412078))

(assert (= (and b!412078 res!239293) b!412077))

(assert (= (and b!412077 res!239292) b!412090))

(assert (= (and b!412090 res!239294) b!412087))

(assert (= (and b!412087 res!239296) b!412080))

(assert (= (and b!412088 condMapEmpty!17499) mapIsEmpty!17499))

(assert (= (and b!412088 (not condMapEmpty!17499)) mapNonEmpty!17499))

(get-info :version)

(assert (= (and mapNonEmpty!17499 ((_ is ValueCellFull!4949) mapValue!17499)) b!412086))

(assert (= (and b!412088 ((_ is ValueCellFull!4949) mapDefault!17499)) b!412089))

(assert (= start!39152 b!412088))

(declare-fun m!401469 () Bool)

(assert (=> b!412080 m!401469))

(declare-fun m!401471 () Bool)

(assert (=> b!412080 m!401471))

(declare-fun m!401473 () Bool)

(assert (=> b!412080 m!401473))

(declare-fun m!401475 () Bool)

(assert (=> b!412078 m!401475))

(declare-fun m!401477 () Bool)

(assert (=> b!412077 m!401477))

(declare-fun m!401479 () Bool)

(assert (=> b!412077 m!401479))

(declare-fun m!401481 () Bool)

(assert (=> b!412090 m!401481))

(declare-fun m!401483 () Bool)

(assert (=> b!412083 m!401483))

(declare-fun m!401485 () Bool)

(assert (=> b!412084 m!401485))

(declare-fun m!401487 () Bool)

(assert (=> b!412081 m!401487))

(declare-fun m!401489 () Bool)

(assert (=> mapNonEmpty!17499 m!401489))

(declare-fun m!401491 () Bool)

(assert (=> b!412079 m!401491))

(declare-fun m!401493 () Bool)

(assert (=> b!412082 m!401493))

(declare-fun m!401495 () Bool)

(assert (=> start!39152 m!401495))

(declare-fun m!401497 () Bool)

(assert (=> start!39152 m!401497))

(check-sat (not b!412077) (not b!412078) (not b!412081) (not b!412084) (not b!412090) (not b!412083) (not mapNonEmpty!17499) b_and!16793 (not start!39152) (not b!412080) tp_is_empty!10585 (not b_next!9433) (not b!412079))
(check-sat b_and!16793 (not b_next!9433))
