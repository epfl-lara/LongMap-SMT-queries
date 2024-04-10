; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38466 () Bool)

(assert start!38466)

(declare-fun b!396983 () Bool)

(declare-fun res!227856 () Bool)

(declare-fun e!240148 () Bool)

(assert (=> b!396983 (=> (not res!227856) (not e!240148))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23683 0))(
  ( (array!23684 (arr!11291 (Array (_ BitVec 32) (_ BitVec 64))) (size!11643 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23683)

(assert (=> b!396983 (= res!227856 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11643 _keys!709))))))

(declare-fun mapNonEmpty!16449 () Bool)

(declare-fun mapRes!16449 () Bool)

(declare-fun tp!32244 () Bool)

(declare-fun e!240145 () Bool)

(assert (=> mapNonEmpty!16449 (= mapRes!16449 (and tp!32244 e!240145))))

(declare-datatypes ((V!14285 0))(
  ( (V!14286 (val!4987 Int)) )
))
(declare-datatypes ((ValueCell!4599 0))(
  ( (ValueCellFull!4599 (v!7234 V!14285)) (EmptyCell!4599) )
))
(declare-fun mapValue!16449 () ValueCell!4599)

(declare-datatypes ((array!23685 0))(
  ( (array!23686 (arr!11292 (Array (_ BitVec 32) ValueCell!4599)) (size!11644 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23685)

(declare-fun mapKey!16449 () (_ BitVec 32))

(declare-fun mapRest!16449 () (Array (_ BitVec 32) ValueCell!4599))

(assert (=> mapNonEmpty!16449 (= (arr!11292 _values!549) (store mapRest!16449 mapKey!16449 mapValue!16449))))

(declare-fun b!396984 () Bool)

(declare-fun res!227855 () Bool)

(assert (=> b!396984 (=> (not res!227855) (not e!240148))))

(declare-datatypes ((List!6538 0))(
  ( (Nil!6535) (Cons!6534 (h!7390 (_ BitVec 64)) (t!11712 List!6538)) )
))
(declare-fun arrayNoDuplicates!0 (array!23683 (_ BitVec 32) List!6538) Bool)

(assert (=> b!396984 (= res!227855 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6535))))

(declare-fun mapIsEmpty!16449 () Bool)

(assert (=> mapIsEmpty!16449 mapRes!16449))

(declare-fun b!396985 () Bool)

(declare-fun res!227857 () Bool)

(assert (=> b!396985 (=> (not res!227857) (not e!240148))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23683 (_ BitVec 32)) Bool)

(assert (=> b!396985 (= res!227857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396986 () Bool)

(declare-fun e!240147 () Bool)

(assert (=> b!396986 (= e!240147 false)))

(declare-fun lt!187235 () Bool)

(declare-fun lt!187234 () array!23683)

(assert (=> b!396986 (= lt!187235 (arrayNoDuplicates!0 lt!187234 #b00000000000000000000000000000000 Nil!6535))))

(declare-fun b!396987 () Bool)

(assert (=> b!396987 (= e!240148 e!240147)))

(declare-fun res!227852 () Bool)

(assert (=> b!396987 (=> (not res!227852) (not e!240147))))

(assert (=> b!396987 (= res!227852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187234 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!396987 (= lt!187234 (array!23684 (store (arr!11291 _keys!709) i!563 k0!794) (size!11643 _keys!709)))))

(declare-fun b!396988 () Bool)

(declare-fun e!240149 () Bool)

(declare-fun tp_is_empty!9885 () Bool)

(assert (=> b!396988 (= e!240149 tp_is_empty!9885)))

(declare-fun b!396989 () Bool)

(declare-fun e!240150 () Bool)

(assert (=> b!396989 (= e!240150 (and e!240149 mapRes!16449))))

(declare-fun condMapEmpty!16449 () Bool)

(declare-fun mapDefault!16449 () ValueCell!4599)

(assert (=> b!396989 (= condMapEmpty!16449 (= (arr!11292 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4599)) mapDefault!16449)))))

(declare-fun b!396990 () Bool)

(declare-fun res!227850 () Bool)

(assert (=> b!396990 (=> (not res!227850) (not e!240148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396990 (= res!227850 (validKeyInArray!0 k0!794))))

(declare-fun b!396991 () Bool)

(declare-fun res!227854 () Bool)

(assert (=> b!396991 (=> (not res!227854) (not e!240148))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396991 (= res!227854 (and (= (size!11644 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11643 _keys!709) (size!11644 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396992 () Bool)

(declare-fun res!227858 () Bool)

(assert (=> b!396992 (=> (not res!227858) (not e!240148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396992 (= res!227858 (validMask!0 mask!1025))))

(declare-fun b!396993 () Bool)

(declare-fun res!227853 () Bool)

(assert (=> b!396993 (=> (not res!227853) (not e!240148))))

(declare-fun arrayContainsKey!0 (array!23683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396993 (= res!227853 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!227851 () Bool)

(assert (=> start!38466 (=> (not res!227851) (not e!240148))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38466 (= res!227851 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11643 _keys!709))))))

(assert (=> start!38466 e!240148))

(assert (=> start!38466 true))

(declare-fun array_inv!8278 (array!23685) Bool)

(assert (=> start!38466 (and (array_inv!8278 _values!549) e!240150)))

(declare-fun array_inv!8279 (array!23683) Bool)

(assert (=> start!38466 (array_inv!8279 _keys!709)))

(declare-fun b!396994 () Bool)

(declare-fun res!227859 () Bool)

(assert (=> b!396994 (=> (not res!227859) (not e!240148))))

(assert (=> b!396994 (= res!227859 (or (= (select (arr!11291 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11291 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396995 () Bool)

(assert (=> b!396995 (= e!240145 tp_is_empty!9885)))

(assert (= (and start!38466 res!227851) b!396992))

(assert (= (and b!396992 res!227858) b!396991))

(assert (= (and b!396991 res!227854) b!396985))

(assert (= (and b!396985 res!227857) b!396984))

(assert (= (and b!396984 res!227855) b!396983))

(assert (= (and b!396983 res!227856) b!396990))

(assert (= (and b!396990 res!227850) b!396994))

(assert (= (and b!396994 res!227859) b!396993))

(assert (= (and b!396993 res!227853) b!396987))

(assert (= (and b!396987 res!227852) b!396986))

(assert (= (and b!396989 condMapEmpty!16449) mapIsEmpty!16449))

(assert (= (and b!396989 (not condMapEmpty!16449)) mapNonEmpty!16449))

(get-info :version)

(assert (= (and mapNonEmpty!16449 ((_ is ValueCellFull!4599) mapValue!16449)) b!396995))

(assert (= (and b!396989 ((_ is ValueCellFull!4599) mapDefault!16449)) b!396988))

(assert (= start!38466 b!396989))

(declare-fun m!392407 () Bool)

(assert (=> b!396994 m!392407))

(declare-fun m!392409 () Bool)

(assert (=> b!396986 m!392409))

(declare-fun m!392411 () Bool)

(assert (=> b!396987 m!392411))

(declare-fun m!392413 () Bool)

(assert (=> b!396987 m!392413))

(declare-fun m!392415 () Bool)

(assert (=> mapNonEmpty!16449 m!392415))

(declare-fun m!392417 () Bool)

(assert (=> b!396992 m!392417))

(declare-fun m!392419 () Bool)

(assert (=> b!396984 m!392419))

(declare-fun m!392421 () Bool)

(assert (=> start!38466 m!392421))

(declare-fun m!392423 () Bool)

(assert (=> start!38466 m!392423))

(declare-fun m!392425 () Bool)

(assert (=> b!396985 m!392425))

(declare-fun m!392427 () Bool)

(assert (=> b!396990 m!392427))

(declare-fun m!392429 () Bool)

(assert (=> b!396993 m!392429))

(check-sat (not mapNonEmpty!16449) (not b!396992) (not b!396987) (not b!396990) (not start!38466) (not b!396993) tp_is_empty!9885 (not b!396984) (not b!396985) (not b!396986))
(check-sat)
