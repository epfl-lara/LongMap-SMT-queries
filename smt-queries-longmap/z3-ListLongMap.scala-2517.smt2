; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38906 () Bool)

(assert start!38906)

(declare-fun b!407083 () Bool)

(declare-fun res!235310 () Bool)

(declare-fun e!244524 () Bool)

(assert (=> b!407083 (=> (not res!235310) (not e!244524))))

(declare-datatypes ((array!24556 0))(
  ( (array!24557 (arr!11727 (Array (_ BitVec 32) (_ BitVec 64))) (size!12079 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24556)

(declare-datatypes ((V!14891 0))(
  ( (V!14892 (val!5214 Int)) )
))
(declare-datatypes ((ValueCell!4826 0))(
  ( (ValueCellFull!4826 (v!7462 V!14891)) (EmptyCell!4826) )
))
(declare-datatypes ((array!24558 0))(
  ( (array!24559 (arr!11728 (Array (_ BitVec 32) ValueCell!4826)) (size!12080 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24558)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407083 (= res!235310 (and (= (size!12080 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12079 _keys!709) (size!12080 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407084 () Bool)

(declare-fun e!244527 () Bool)

(declare-fun e!244525 () Bool)

(declare-fun mapRes!17130 () Bool)

(assert (=> b!407084 (= e!244527 (and e!244525 mapRes!17130))))

(declare-fun condMapEmpty!17130 () Bool)

(declare-fun mapDefault!17130 () ValueCell!4826)

(assert (=> b!407084 (= condMapEmpty!17130 (= (arr!11728 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4826)) mapDefault!17130)))))

(declare-fun b!407085 () Bool)

(declare-fun tp_is_empty!10339 () Bool)

(assert (=> b!407085 (= e!244525 tp_is_empty!10339)))

(declare-fun b!407086 () Bool)

(declare-fun res!235308 () Bool)

(assert (=> b!407086 (=> (not res!235308) (not e!244524))))

(declare-datatypes ((List!6682 0))(
  ( (Nil!6679) (Cons!6678 (h!7534 (_ BitVec 64)) (t!11848 List!6682)) )
))
(declare-fun arrayNoDuplicates!0 (array!24556 (_ BitVec 32) List!6682) Bool)

(assert (=> b!407086 (= res!235308 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6679))))

(declare-fun res!235306 () Bool)

(assert (=> start!38906 (=> (not res!235306) (not e!244524))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38906 (= res!235306 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12079 _keys!709))))))

(assert (=> start!38906 e!244524))

(assert (=> start!38906 true))

(declare-fun array_inv!8644 (array!24558) Bool)

(assert (=> start!38906 (and (array_inv!8644 _values!549) e!244527)))

(declare-fun array_inv!8645 (array!24556) Bool)

(assert (=> start!38906 (array_inv!8645 _keys!709)))

(declare-fun b!407087 () Bool)

(declare-fun e!244528 () Bool)

(assert (=> b!407087 (= e!244524 e!244528)))

(declare-fun res!235309 () Bool)

(assert (=> b!407087 (=> (not res!235309) (not e!244528))))

(declare-fun lt!188616 () array!24556)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24556 (_ BitVec 32)) Bool)

(assert (=> b!407087 (= res!235309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188616 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407087 (= lt!188616 (array!24557 (store (arr!11727 _keys!709) i!563 k0!794) (size!12079 _keys!709)))))

(declare-fun b!407088 () Bool)

(declare-fun res!235305 () Bool)

(assert (=> b!407088 (=> (not res!235305) (not e!244524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407088 (= res!235305 (validMask!0 mask!1025))))

(declare-fun b!407089 () Bool)

(declare-fun res!235311 () Bool)

(assert (=> b!407089 (=> (not res!235311) (not e!244524))))

(declare-fun arrayContainsKey!0 (array!24556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407089 (= res!235311 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407090 () Bool)

(declare-fun res!235312 () Bool)

(assert (=> b!407090 (=> (not res!235312) (not e!244524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407090 (= res!235312 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!17130 () Bool)

(declare-fun tp!33249 () Bool)

(declare-fun e!244523 () Bool)

(assert (=> mapNonEmpty!17130 (= mapRes!17130 (and tp!33249 e!244523))))

(declare-fun mapValue!17130 () ValueCell!4826)

(declare-fun mapKey!17130 () (_ BitVec 32))

(declare-fun mapRest!17130 () (Array (_ BitVec 32) ValueCell!4826))

(assert (=> mapNonEmpty!17130 (= (arr!11728 _values!549) (store mapRest!17130 mapKey!17130 mapValue!17130))))

(declare-fun b!407091 () Bool)

(declare-fun res!235313 () Bool)

(assert (=> b!407091 (=> (not res!235313) (not e!244524))))

(assert (=> b!407091 (= res!235313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407092 () Bool)

(declare-fun res!235314 () Bool)

(assert (=> b!407092 (=> (not res!235314) (not e!244524))))

(assert (=> b!407092 (= res!235314 (or (= (select (arr!11727 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11727 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407093 () Bool)

(assert (=> b!407093 (= e!244528 false)))

(declare-fun lt!188615 () Bool)

(assert (=> b!407093 (= lt!188615 (arrayNoDuplicates!0 lt!188616 #b00000000000000000000000000000000 Nil!6679))))

(declare-fun b!407094 () Bool)

(assert (=> b!407094 (= e!244523 tp_is_empty!10339)))

(declare-fun b!407095 () Bool)

(declare-fun res!235307 () Bool)

(assert (=> b!407095 (=> (not res!235307) (not e!244524))))

(assert (=> b!407095 (= res!235307 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12079 _keys!709))))))

(declare-fun mapIsEmpty!17130 () Bool)

(assert (=> mapIsEmpty!17130 mapRes!17130))

(assert (= (and start!38906 res!235306) b!407088))

(assert (= (and b!407088 res!235305) b!407083))

(assert (= (and b!407083 res!235310) b!407091))

(assert (= (and b!407091 res!235313) b!407086))

(assert (= (and b!407086 res!235308) b!407095))

(assert (= (and b!407095 res!235307) b!407090))

(assert (= (and b!407090 res!235312) b!407092))

(assert (= (and b!407092 res!235314) b!407089))

(assert (= (and b!407089 res!235311) b!407087))

(assert (= (and b!407087 res!235309) b!407093))

(assert (= (and b!407084 condMapEmpty!17130) mapIsEmpty!17130))

(assert (= (and b!407084 (not condMapEmpty!17130)) mapNonEmpty!17130))

(get-info :version)

(assert (= (and mapNonEmpty!17130 ((_ is ValueCellFull!4826) mapValue!17130)) b!407094))

(assert (= (and b!407084 ((_ is ValueCellFull!4826) mapDefault!17130)) b!407085))

(assert (= start!38906 b!407084))

(declare-fun m!399165 () Bool)

(assert (=> b!407093 m!399165))

(declare-fun m!399167 () Bool)

(assert (=> mapNonEmpty!17130 m!399167))

(declare-fun m!399169 () Bool)

(assert (=> b!407086 m!399169))

(declare-fun m!399171 () Bool)

(assert (=> b!407092 m!399171))

(declare-fun m!399173 () Bool)

(assert (=> b!407090 m!399173))

(declare-fun m!399175 () Bool)

(assert (=> b!407091 m!399175))

(declare-fun m!399177 () Bool)

(assert (=> b!407088 m!399177))

(declare-fun m!399179 () Bool)

(assert (=> start!38906 m!399179))

(declare-fun m!399181 () Bool)

(assert (=> start!38906 m!399181))

(declare-fun m!399183 () Bool)

(assert (=> b!407089 m!399183))

(declare-fun m!399185 () Bool)

(assert (=> b!407087 m!399185))

(declare-fun m!399187 () Bool)

(assert (=> b!407087 m!399187))

(check-sat (not b!407093) (not mapNonEmpty!17130) (not start!38906) (not b!407091) (not b!407088) (not b!407090) (not b!407086) (not b!407087) (not b!407089) tp_is_empty!10339)
(check-sat)
