; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38762 () Bool)

(assert start!38762)

(declare-fun b!404053 () Bool)

(declare-fun res!233022 () Bool)

(declare-fun e!243085 () Bool)

(assert (=> b!404053 (=> (not res!233022) (not e!243085))))

(declare-datatypes ((array!24271 0))(
  ( (array!24272 (arr!11585 (Array (_ BitVec 32) (_ BitVec 64))) (size!11938 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24271)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24271 (_ BitVec 32)) Bool)

(assert (=> b!404053 (= res!233022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16914 () Bool)

(declare-fun mapRes!16914 () Bool)

(assert (=> mapIsEmpty!16914 mapRes!16914))

(declare-fun b!404054 () Bool)

(declare-fun res!233026 () Bool)

(assert (=> b!404054 (=> (not res!233026) (not e!243085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404054 (= res!233026 (validMask!0 mask!1025))))

(declare-fun b!404055 () Bool)

(declare-fun res!233023 () Bool)

(assert (=> b!404055 (=> (not res!233023) (not e!243085))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404055 (= res!233023 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404056 () Bool)

(declare-fun res!233021 () Bool)

(assert (=> b!404056 (=> (not res!233021) (not e!243085))))

(declare-datatypes ((List!6725 0))(
  ( (Nil!6722) (Cons!6721 (h!7577 (_ BitVec 64)) (t!11890 List!6725)) )
))
(declare-fun arrayNoDuplicates!0 (array!24271 (_ BitVec 32) List!6725) Bool)

(assert (=> b!404056 (= res!233021 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6722))))

(declare-fun res!233025 () Bool)

(assert (=> start!38762 (=> (not res!233025) (not e!243085))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38762 (= res!233025 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11938 _keys!709))))))

(assert (=> start!38762 e!243085))

(assert (=> start!38762 true))

(declare-datatypes ((V!14699 0))(
  ( (V!14700 (val!5142 Int)) )
))
(declare-datatypes ((ValueCell!4754 0))(
  ( (ValueCellFull!4754 (v!7383 V!14699)) (EmptyCell!4754) )
))
(declare-datatypes ((array!24273 0))(
  ( (array!24274 (arr!11586 (Array (_ BitVec 32) ValueCell!4754)) (size!11939 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24273)

(declare-fun e!243089 () Bool)

(declare-fun array_inv!8504 (array!24273) Bool)

(assert (=> start!38762 (and (array_inv!8504 _values!549) e!243089)))

(declare-fun array_inv!8505 (array!24271) Bool)

(assert (=> start!38762 (array_inv!8505 _keys!709)))

(declare-fun b!404057 () Bool)

(declare-fun res!233028 () Bool)

(assert (=> b!404057 (=> (not res!233028) (not e!243085))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404057 (= res!233028 (and (= (size!11939 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11938 _keys!709) (size!11939 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404058 () Bool)

(declare-fun e!243086 () Bool)

(assert (=> b!404058 (= e!243085 e!243086)))

(declare-fun res!233024 () Bool)

(assert (=> b!404058 (=> (not res!233024) (not e!243086))))

(declare-fun lt!187931 () array!24271)

(assert (=> b!404058 (= res!233024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187931 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404058 (= lt!187931 (array!24272 (store (arr!11585 _keys!709) i!563 k0!794) (size!11938 _keys!709)))))

(declare-fun b!404059 () Bool)

(declare-fun res!233027 () Bool)

(assert (=> b!404059 (=> (not res!233027) (not e!243085))))

(assert (=> b!404059 (= res!233027 (or (= (select (arr!11585 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11585 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404060 () Bool)

(declare-fun e!243090 () Bool)

(declare-fun tp_is_empty!10195 () Bool)

(assert (=> b!404060 (= e!243090 tp_is_empty!10195)))

(declare-fun b!404061 () Bool)

(declare-fun e!243088 () Bool)

(assert (=> b!404061 (= e!243089 (and e!243088 mapRes!16914))))

(declare-fun condMapEmpty!16914 () Bool)

(declare-fun mapDefault!16914 () ValueCell!4754)

(assert (=> b!404061 (= condMapEmpty!16914 (= (arr!11586 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4754)) mapDefault!16914)))))

(declare-fun b!404062 () Bool)

(assert (=> b!404062 (= e!243088 tp_is_empty!10195)))

(declare-fun b!404063 () Bool)

(declare-fun res!233020 () Bool)

(assert (=> b!404063 (=> (not res!233020) (not e!243085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404063 (= res!233020 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!16914 () Bool)

(declare-fun tp!33033 () Bool)

(assert (=> mapNonEmpty!16914 (= mapRes!16914 (and tp!33033 e!243090))))

(declare-fun mapValue!16914 () ValueCell!4754)

(declare-fun mapKey!16914 () (_ BitVec 32))

(declare-fun mapRest!16914 () (Array (_ BitVec 32) ValueCell!4754))

(assert (=> mapNonEmpty!16914 (= (arr!11586 _values!549) (store mapRest!16914 mapKey!16914 mapValue!16914))))

(declare-fun b!404064 () Bool)

(declare-fun res!233019 () Bool)

(assert (=> b!404064 (=> (not res!233019) (not e!243085))))

(assert (=> b!404064 (= res!233019 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11938 _keys!709))))))

(declare-fun b!404065 () Bool)

(assert (=> b!404065 (= e!243086 false)))

(declare-fun lt!187930 () Bool)

(assert (=> b!404065 (= lt!187930 (arrayNoDuplicates!0 lt!187931 #b00000000000000000000000000000000 Nil!6722))))

(assert (= (and start!38762 res!233025) b!404054))

(assert (= (and b!404054 res!233026) b!404057))

(assert (= (and b!404057 res!233028) b!404053))

(assert (= (and b!404053 res!233022) b!404056))

(assert (= (and b!404056 res!233021) b!404064))

(assert (= (and b!404064 res!233019) b!404063))

(assert (= (and b!404063 res!233020) b!404059))

(assert (= (and b!404059 res!233027) b!404055))

(assert (= (and b!404055 res!233023) b!404058))

(assert (= (and b!404058 res!233024) b!404065))

(assert (= (and b!404061 condMapEmpty!16914) mapIsEmpty!16914))

(assert (= (and b!404061 (not condMapEmpty!16914)) mapNonEmpty!16914))

(get-info :version)

(assert (= (and mapNonEmpty!16914 ((_ is ValueCellFull!4754) mapValue!16914)) b!404060))

(assert (= (and b!404061 ((_ is ValueCellFull!4754) mapDefault!16914)) b!404062))

(assert (= start!38762 b!404061))

(declare-fun m!396483 () Bool)

(assert (=> b!404065 m!396483))

(declare-fun m!396485 () Bool)

(assert (=> b!404056 m!396485))

(declare-fun m!396487 () Bool)

(assert (=> b!404058 m!396487))

(declare-fun m!396489 () Bool)

(assert (=> b!404058 m!396489))

(declare-fun m!396491 () Bool)

(assert (=> b!404054 m!396491))

(declare-fun m!396493 () Bool)

(assert (=> mapNonEmpty!16914 m!396493))

(declare-fun m!396495 () Bool)

(assert (=> b!404063 m!396495))

(declare-fun m!396497 () Bool)

(assert (=> b!404055 m!396497))

(declare-fun m!396499 () Bool)

(assert (=> b!404053 m!396499))

(declare-fun m!396501 () Bool)

(assert (=> b!404059 m!396501))

(declare-fun m!396503 () Bool)

(assert (=> start!38762 m!396503))

(declare-fun m!396505 () Bool)

(assert (=> start!38762 m!396505))

(check-sat (not b!404053) (not b!404056) (not start!38762) (not b!404065) (not b!404055) (not b!404063) (not mapNonEmpty!16914) tp_is_empty!10195 (not b!404054) (not b!404058))
(check-sat)
