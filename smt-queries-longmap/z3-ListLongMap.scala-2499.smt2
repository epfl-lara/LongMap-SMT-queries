; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38798 () Bool)

(assert start!38798)

(declare-fun b!404977 () Bool)

(declare-fun e!243555 () Bool)

(declare-fun tp_is_empty!10231 () Bool)

(assert (=> b!404977 (= e!243555 tp_is_empty!10231)))

(declare-fun b!404978 () Bool)

(declare-fun e!243551 () Bool)

(assert (=> b!404978 (= e!243551 tp_is_empty!10231)))

(declare-fun b!404979 () Bool)

(declare-fun res!233693 () Bool)

(declare-fun e!243553 () Bool)

(assert (=> b!404979 (=> (not res!233693) (not e!243553))))

(declare-datatypes ((array!24342 0))(
  ( (array!24343 (arr!11620 (Array (_ BitVec 32) (_ BitVec 64))) (size!11972 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24342)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24342 (_ BitVec 32)) Bool)

(assert (=> b!404979 (= res!233693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404980 () Bool)

(declare-fun res!233694 () Bool)

(assert (=> b!404980 (=> (not res!233694) (not e!243553))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14747 0))(
  ( (V!14748 (val!5160 Int)) )
))
(declare-datatypes ((ValueCell!4772 0))(
  ( (ValueCellFull!4772 (v!7408 V!14747)) (EmptyCell!4772) )
))
(declare-datatypes ((array!24344 0))(
  ( (array!24345 (arr!11621 (Array (_ BitVec 32) ValueCell!4772)) (size!11973 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24344)

(assert (=> b!404980 (= res!233694 (and (= (size!11973 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11972 _keys!709) (size!11973 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16968 () Bool)

(declare-fun mapRes!16968 () Bool)

(assert (=> mapIsEmpty!16968 mapRes!16968))

(declare-fun b!404981 () Bool)

(declare-fun res!233688 () Bool)

(assert (=> b!404981 (=> (not res!233688) (not e!243553))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404981 (= res!233688 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11972 _keys!709))))))

(declare-fun b!404982 () Bool)

(declare-fun res!233690 () Bool)

(assert (=> b!404982 (=> (not res!233690) (not e!243553))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404982 (= res!233690 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404983 () Bool)

(declare-fun e!243552 () Bool)

(assert (=> b!404983 (= e!243552 false)))

(declare-fun lt!188292 () Bool)

(declare-fun lt!188291 () array!24342)

(declare-datatypes ((List!6639 0))(
  ( (Nil!6636) (Cons!6635 (h!7491 (_ BitVec 64)) (t!11805 List!6639)) )
))
(declare-fun arrayNoDuplicates!0 (array!24342 (_ BitVec 32) List!6639) Bool)

(assert (=> b!404983 (= lt!188292 (arrayNoDuplicates!0 lt!188291 #b00000000000000000000000000000000 Nil!6636))))

(declare-fun b!404984 () Bool)

(declare-fun res!233692 () Bool)

(assert (=> b!404984 (=> (not res!233692) (not e!243553))))

(assert (=> b!404984 (= res!233692 (or (= (select (arr!11620 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11620 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404985 () Bool)

(declare-fun res!233687 () Bool)

(assert (=> b!404985 (=> (not res!233687) (not e!243553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404985 (= res!233687 (validKeyInArray!0 k0!794))))

(declare-fun res!233691 () Bool)

(assert (=> start!38798 (=> (not res!233691) (not e!243553))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38798 (= res!233691 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11972 _keys!709))))))

(assert (=> start!38798 e!243553))

(assert (=> start!38798 true))

(declare-fun e!243554 () Bool)

(declare-fun array_inv!8582 (array!24344) Bool)

(assert (=> start!38798 (and (array_inv!8582 _values!549) e!243554)))

(declare-fun array_inv!8583 (array!24342) Bool)

(assert (=> start!38798 (array_inv!8583 _keys!709)))

(declare-fun b!404986 () Bool)

(assert (=> b!404986 (= e!243553 e!243552)))

(declare-fun res!233685 () Bool)

(assert (=> b!404986 (=> (not res!233685) (not e!243552))))

(assert (=> b!404986 (= res!233685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188291 mask!1025))))

(assert (=> b!404986 (= lt!188291 (array!24343 (store (arr!11620 _keys!709) i!563 k0!794) (size!11972 _keys!709)))))

(declare-fun b!404987 () Bool)

(assert (=> b!404987 (= e!243554 (and e!243551 mapRes!16968))))

(declare-fun condMapEmpty!16968 () Bool)

(declare-fun mapDefault!16968 () ValueCell!4772)

(assert (=> b!404987 (= condMapEmpty!16968 (= (arr!11621 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4772)) mapDefault!16968)))))

(declare-fun b!404988 () Bool)

(declare-fun res!233689 () Bool)

(assert (=> b!404988 (=> (not res!233689) (not e!243553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404988 (= res!233689 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16968 () Bool)

(declare-fun tp!33087 () Bool)

(assert (=> mapNonEmpty!16968 (= mapRes!16968 (and tp!33087 e!243555))))

(declare-fun mapValue!16968 () ValueCell!4772)

(declare-fun mapRest!16968 () (Array (_ BitVec 32) ValueCell!4772))

(declare-fun mapKey!16968 () (_ BitVec 32))

(assert (=> mapNonEmpty!16968 (= (arr!11621 _values!549) (store mapRest!16968 mapKey!16968 mapValue!16968))))

(declare-fun b!404989 () Bool)

(declare-fun res!233686 () Bool)

(assert (=> b!404989 (=> (not res!233686) (not e!243553))))

(assert (=> b!404989 (= res!233686 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6636))))

(assert (= (and start!38798 res!233691) b!404988))

(assert (= (and b!404988 res!233689) b!404980))

(assert (= (and b!404980 res!233694) b!404979))

(assert (= (and b!404979 res!233693) b!404989))

(assert (= (and b!404989 res!233686) b!404981))

(assert (= (and b!404981 res!233688) b!404985))

(assert (= (and b!404985 res!233687) b!404984))

(assert (= (and b!404984 res!233692) b!404982))

(assert (= (and b!404982 res!233690) b!404986))

(assert (= (and b!404986 res!233685) b!404983))

(assert (= (and b!404987 condMapEmpty!16968) mapIsEmpty!16968))

(assert (= (and b!404987 (not condMapEmpty!16968)) mapNonEmpty!16968))

(get-info :version)

(assert (= (and mapNonEmpty!16968 ((_ is ValueCellFull!4772) mapValue!16968)) b!404977))

(assert (= (and b!404987 ((_ is ValueCellFull!4772) mapDefault!16968)) b!404978))

(assert (= start!38798 b!404987))

(declare-fun m!397869 () Bool)

(assert (=> b!404983 m!397869))

(declare-fun m!397871 () Bool)

(assert (=> b!404989 m!397871))

(declare-fun m!397873 () Bool)

(assert (=> b!404988 m!397873))

(declare-fun m!397875 () Bool)

(assert (=> b!404984 m!397875))

(declare-fun m!397877 () Bool)

(assert (=> b!404986 m!397877))

(declare-fun m!397879 () Bool)

(assert (=> b!404986 m!397879))

(declare-fun m!397881 () Bool)

(assert (=> b!404982 m!397881))

(declare-fun m!397883 () Bool)

(assert (=> start!38798 m!397883))

(declare-fun m!397885 () Bool)

(assert (=> start!38798 m!397885))

(declare-fun m!397887 () Bool)

(assert (=> b!404979 m!397887))

(declare-fun m!397889 () Bool)

(assert (=> mapNonEmpty!16968 m!397889))

(declare-fun m!397891 () Bool)

(assert (=> b!404985 m!397891))

(check-sat tp_is_empty!10231 (not start!38798) (not b!404988) (not b!404983) (not mapNonEmpty!16968) (not b!404982) (not b!404979) (not b!404989) (not b!404985) (not b!404986))
(check-sat)
