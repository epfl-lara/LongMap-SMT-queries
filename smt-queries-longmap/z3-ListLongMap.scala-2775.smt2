; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40508 () Bool)

(assert start!40508)

(declare-fun b!446414 () Bool)

(declare-fun res!265005 () Bool)

(declare-fun e!262262 () Bool)

(assert (=> b!446414 (=> (not res!265005) (not e!262262))))

(declare-datatypes ((array!27586 0))(
  ( (array!27587 (arr!13239 (Array (_ BitVec 32) (_ BitVec 64))) (size!13591 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27586)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16955 0))(
  ( (V!16956 (val!5988 Int)) )
))
(declare-datatypes ((ValueCell!5600 0))(
  ( (ValueCellFull!5600 (v!8244 V!16955)) (EmptyCell!5600) )
))
(declare-datatypes ((array!27588 0))(
  ( (array!27589 (arr!13240 (Array (_ BitVec 32) ValueCell!5600)) (size!13592 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27588)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!446414 (= res!265005 (and (= (size!13592 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13591 _keys!709) (size!13592 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446415 () Bool)

(declare-fun res!265003 () Bool)

(assert (=> b!446415 (=> (not res!265003) (not e!262262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27586 (_ BitVec 32)) Bool)

(assert (=> b!446415 (= res!265003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19461 () Bool)

(declare-fun mapRes!19461 () Bool)

(assert (=> mapIsEmpty!19461 mapRes!19461))

(declare-fun b!446416 () Bool)

(declare-fun res!265004 () Bool)

(assert (=> b!446416 (=> (not res!265004) (not e!262262))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446416 (= res!265004 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446417 () Bool)

(declare-fun res!264998 () Bool)

(assert (=> b!446417 (=> (not res!264998) (not e!262262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446417 (= res!264998 (validMask!0 mask!1025))))

(declare-fun b!446418 () Bool)

(declare-fun res!265000 () Bool)

(assert (=> b!446418 (=> (not res!265000) (not e!262262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446418 (= res!265000 (validKeyInArray!0 k0!794))))

(declare-fun b!446419 () Bool)

(declare-fun res!264999 () Bool)

(assert (=> b!446419 (=> (not res!264999) (not e!262262))))

(declare-datatypes ((List!7835 0))(
  ( (Nil!7832) (Cons!7831 (h!8687 (_ BitVec 64)) (t!13587 List!7835)) )
))
(declare-fun arrayNoDuplicates!0 (array!27586 (_ BitVec 32) List!7835) Bool)

(assert (=> b!446419 (= res!264999 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7832))))

(declare-fun b!446420 () Bool)

(declare-fun res!264996 () Bool)

(assert (=> b!446420 (=> (not res!264996) (not e!262262))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446420 (= res!264996 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13591 _keys!709))))))

(declare-fun b!446421 () Bool)

(declare-fun e!262260 () Bool)

(declare-fun e!262263 () Bool)

(assert (=> b!446421 (= e!262260 (and e!262263 mapRes!19461))))

(declare-fun condMapEmpty!19461 () Bool)

(declare-fun mapDefault!19461 () ValueCell!5600)

(assert (=> b!446421 (= condMapEmpty!19461 (= (arr!13240 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5600)) mapDefault!19461)))))

(declare-fun b!446422 () Bool)

(declare-fun e!262259 () Bool)

(assert (=> b!446422 (= e!262259 false)))

(declare-fun lt!203832 () Bool)

(declare-fun lt!203831 () array!27586)

(assert (=> b!446422 (= lt!203832 (arrayNoDuplicates!0 lt!203831 #b00000000000000000000000000000000 Nil!7832))))

(declare-fun b!446423 () Bool)

(assert (=> b!446423 (= e!262262 e!262259)))

(declare-fun res!265001 () Bool)

(assert (=> b!446423 (=> (not res!265001) (not e!262259))))

(assert (=> b!446423 (= res!265001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203831 mask!1025))))

(assert (=> b!446423 (= lt!203831 (array!27587 (store (arr!13239 _keys!709) i!563 k0!794) (size!13591 _keys!709)))))

(declare-fun b!446424 () Bool)

(declare-fun e!262264 () Bool)

(declare-fun tp_is_empty!11887 () Bool)

(assert (=> b!446424 (= e!262264 tp_is_empty!11887)))

(declare-fun b!446425 () Bool)

(assert (=> b!446425 (= e!262263 tp_is_empty!11887)))

(declare-fun res!265002 () Bool)

(assert (=> start!40508 (=> (not res!265002) (not e!262262))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40508 (= res!265002 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13591 _keys!709))))))

(assert (=> start!40508 e!262262))

(assert (=> start!40508 true))

(declare-fun array_inv!9680 (array!27588) Bool)

(assert (=> start!40508 (and (array_inv!9680 _values!549) e!262260)))

(declare-fun array_inv!9681 (array!27586) Bool)

(assert (=> start!40508 (array_inv!9681 _keys!709)))

(declare-fun b!446426 () Bool)

(declare-fun res!264997 () Bool)

(assert (=> b!446426 (=> (not res!264997) (not e!262262))))

(assert (=> b!446426 (= res!264997 (or (= (select (arr!13239 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13239 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19461 () Bool)

(declare-fun tp!37488 () Bool)

(assert (=> mapNonEmpty!19461 (= mapRes!19461 (and tp!37488 e!262264))))

(declare-fun mapValue!19461 () ValueCell!5600)

(declare-fun mapKey!19461 () (_ BitVec 32))

(declare-fun mapRest!19461 () (Array (_ BitVec 32) ValueCell!5600))

(assert (=> mapNonEmpty!19461 (= (arr!13240 _values!549) (store mapRest!19461 mapKey!19461 mapValue!19461))))

(assert (= (and start!40508 res!265002) b!446417))

(assert (= (and b!446417 res!264998) b!446414))

(assert (= (and b!446414 res!265005) b!446415))

(assert (= (and b!446415 res!265003) b!446419))

(assert (= (and b!446419 res!264999) b!446420))

(assert (= (and b!446420 res!264996) b!446418))

(assert (= (and b!446418 res!265000) b!446426))

(assert (= (and b!446426 res!264997) b!446416))

(assert (= (and b!446416 res!265004) b!446423))

(assert (= (and b!446423 res!265001) b!446422))

(assert (= (and b!446421 condMapEmpty!19461) mapIsEmpty!19461))

(assert (= (and b!446421 (not condMapEmpty!19461)) mapNonEmpty!19461))

(get-info :version)

(assert (= (and mapNonEmpty!19461 ((_ is ValueCellFull!5600) mapValue!19461)) b!446424))

(assert (= (and b!446421 ((_ is ValueCellFull!5600) mapDefault!19461)) b!446425))

(assert (= start!40508 b!446421))

(declare-fun m!431915 () Bool)

(assert (=> b!446419 m!431915))

(declare-fun m!431917 () Bool)

(assert (=> b!446418 m!431917))

(declare-fun m!431919 () Bool)

(assert (=> b!446423 m!431919))

(declare-fun m!431921 () Bool)

(assert (=> b!446423 m!431921))

(declare-fun m!431923 () Bool)

(assert (=> b!446426 m!431923))

(declare-fun m!431925 () Bool)

(assert (=> b!446416 m!431925))

(declare-fun m!431927 () Bool)

(assert (=> b!446422 m!431927))

(declare-fun m!431929 () Bool)

(assert (=> mapNonEmpty!19461 m!431929))

(declare-fun m!431931 () Bool)

(assert (=> b!446417 m!431931))

(declare-fun m!431933 () Bool)

(assert (=> b!446415 m!431933))

(declare-fun m!431935 () Bool)

(assert (=> start!40508 m!431935))

(declare-fun m!431937 () Bool)

(assert (=> start!40508 m!431937))

(check-sat (not b!446419) (not b!446423) (not mapNonEmpty!19461) (not start!40508) (not b!446422) (not b!446418) tp_is_empty!11887 (not b!446416) (not b!446415) (not b!446417))
(check-sat)
