; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38894 () Bool)

(assert start!38894)

(declare-fun b!406627 () Bool)

(declare-fun e!244274 () Bool)

(declare-fun e!244277 () Bool)

(assert (=> b!406627 (= e!244274 e!244277)))

(declare-fun res!235003 () Bool)

(assert (=> b!406627 (=> (not res!235003) (not e!244277))))

(declare-datatypes ((array!24527 0))(
  ( (array!24528 (arr!11713 (Array (_ BitVec 32) (_ BitVec 64))) (size!12066 (_ BitVec 32))) )
))
(declare-fun lt!188327 () array!24527)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24527 (_ BitVec 32)) Bool)

(assert (=> b!406627 (= res!235003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188327 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!24527)

(assert (=> b!406627 (= lt!188327 (array!24528 (store (arr!11713 _keys!709) i!563 k0!794) (size!12066 _keys!709)))))

(declare-fun b!406628 () Bool)

(declare-fun e!244275 () Bool)

(declare-fun tp_is_empty!10327 () Bool)

(assert (=> b!406628 (= e!244275 tp_is_empty!10327)))

(declare-fun b!406629 () Bool)

(declare-fun res!235000 () Bool)

(assert (=> b!406629 (=> (not res!235000) (not e!244274))))

(declare-fun arrayContainsKey!0 (array!24527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406629 (= res!235000 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406630 () Bool)

(declare-fun res!235008 () Bool)

(assert (=> b!406630 (=> (not res!235008) (not e!244274))))

(assert (=> b!406630 (= res!235008 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12066 _keys!709))))))

(declare-fun b!406631 () Bool)

(declare-fun res!235004 () Bool)

(assert (=> b!406631 (=> (not res!235004) (not e!244274))))

(assert (=> b!406631 (= res!235004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406632 () Bool)

(declare-fun e!244276 () Bool)

(assert (=> b!406632 (= e!244276 tp_is_empty!10327)))

(declare-fun b!406633 () Bool)

(declare-fun res!235001 () Bool)

(assert (=> b!406633 (=> (not res!235001) (not e!244274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406633 (= res!235001 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17112 () Bool)

(declare-fun mapRes!17112 () Bool)

(assert (=> mapIsEmpty!17112 mapRes!17112))

(declare-fun res!234999 () Bool)

(assert (=> start!38894 (=> (not res!234999) (not e!244274))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38894 (= res!234999 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12066 _keys!709))))))

(assert (=> start!38894 e!244274))

(assert (=> start!38894 true))

(declare-datatypes ((V!14875 0))(
  ( (V!14876 (val!5208 Int)) )
))
(declare-datatypes ((ValueCell!4820 0))(
  ( (ValueCellFull!4820 (v!7449 V!14875)) (EmptyCell!4820) )
))
(declare-datatypes ((array!24529 0))(
  ( (array!24530 (arr!11714 (Array (_ BitVec 32) ValueCell!4820)) (size!12067 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24529)

(declare-fun e!244278 () Bool)

(declare-fun array_inv!8592 (array!24529) Bool)

(assert (=> start!38894 (and (array_inv!8592 _values!549) e!244278)))

(declare-fun array_inv!8593 (array!24527) Bool)

(assert (=> start!38894 (array_inv!8593 _keys!709)))

(declare-fun b!406634 () Bool)

(declare-fun res!235006 () Bool)

(assert (=> b!406634 (=> (not res!235006) (not e!244274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406634 (= res!235006 (validMask!0 mask!1025))))

(declare-fun b!406635 () Bool)

(declare-fun res!235005 () Bool)

(assert (=> b!406635 (=> (not res!235005) (not e!244274))))

(assert (=> b!406635 (= res!235005 (or (= (select (arr!11713 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11713 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406636 () Bool)

(declare-fun res!235002 () Bool)

(assert (=> b!406636 (=> (not res!235002) (not e!244274))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406636 (= res!235002 (and (= (size!12067 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12066 _keys!709) (size!12067 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406637 () Bool)

(declare-fun res!235007 () Bool)

(assert (=> b!406637 (=> (not res!235007) (not e!244274))))

(declare-datatypes ((List!6777 0))(
  ( (Nil!6774) (Cons!6773 (h!7629 (_ BitVec 64)) (t!11942 List!6777)) )
))
(declare-fun arrayNoDuplicates!0 (array!24527 (_ BitVec 32) List!6777) Bool)

(assert (=> b!406637 (= res!235007 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6774))))

(declare-fun b!406638 () Bool)

(assert (=> b!406638 (= e!244277 false)))

(declare-fun lt!188326 () Bool)

(assert (=> b!406638 (= lt!188326 (arrayNoDuplicates!0 lt!188327 #b00000000000000000000000000000000 Nil!6774))))

(declare-fun mapNonEmpty!17112 () Bool)

(declare-fun tp!33231 () Bool)

(assert (=> mapNonEmpty!17112 (= mapRes!17112 (and tp!33231 e!244275))))

(declare-fun mapKey!17112 () (_ BitVec 32))

(declare-fun mapValue!17112 () ValueCell!4820)

(declare-fun mapRest!17112 () (Array (_ BitVec 32) ValueCell!4820))

(assert (=> mapNonEmpty!17112 (= (arr!11714 _values!549) (store mapRest!17112 mapKey!17112 mapValue!17112))))

(declare-fun b!406639 () Bool)

(assert (=> b!406639 (= e!244278 (and e!244276 mapRes!17112))))

(declare-fun condMapEmpty!17112 () Bool)

(declare-fun mapDefault!17112 () ValueCell!4820)

(assert (=> b!406639 (= condMapEmpty!17112 (= (arr!11714 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4820)) mapDefault!17112)))))

(assert (= (and start!38894 res!234999) b!406634))

(assert (= (and b!406634 res!235006) b!406636))

(assert (= (and b!406636 res!235002) b!406631))

(assert (= (and b!406631 res!235004) b!406637))

(assert (= (and b!406637 res!235007) b!406630))

(assert (= (and b!406630 res!235008) b!406633))

(assert (= (and b!406633 res!235001) b!406635))

(assert (= (and b!406635 res!235005) b!406629))

(assert (= (and b!406629 res!235000) b!406627))

(assert (= (and b!406627 res!235003) b!406638))

(assert (= (and b!406639 condMapEmpty!17112) mapIsEmpty!17112))

(assert (= (and b!406639 (not condMapEmpty!17112)) mapNonEmpty!17112))

(get-info :version)

(assert (= (and mapNonEmpty!17112 ((_ is ValueCellFull!4820) mapValue!17112)) b!406628))

(assert (= (and b!406639 ((_ is ValueCellFull!4820) mapDefault!17112)) b!406632))

(assert (= start!38894 b!406639))

(declare-fun m!398067 () Bool)

(assert (=> mapNonEmpty!17112 m!398067))

(declare-fun m!398069 () Bool)

(assert (=> b!406638 m!398069))

(declare-fun m!398071 () Bool)

(assert (=> b!406633 m!398071))

(declare-fun m!398073 () Bool)

(assert (=> b!406635 m!398073))

(declare-fun m!398075 () Bool)

(assert (=> b!406627 m!398075))

(declare-fun m!398077 () Bool)

(assert (=> b!406627 m!398077))

(declare-fun m!398079 () Bool)

(assert (=> b!406631 m!398079))

(declare-fun m!398081 () Bool)

(assert (=> b!406629 m!398081))

(declare-fun m!398083 () Bool)

(assert (=> start!38894 m!398083))

(declare-fun m!398085 () Bool)

(assert (=> start!38894 m!398085))

(declare-fun m!398087 () Bool)

(assert (=> b!406634 m!398087))

(declare-fun m!398089 () Bool)

(assert (=> b!406637 m!398089))

(check-sat (not b!406634) (not b!406627) (not b!406629) (not b!406637) (not b!406631) (not mapNonEmpty!17112) (not start!38894) tp_is_empty!10327 (not b!406633) (not b!406638))
(check-sat)
