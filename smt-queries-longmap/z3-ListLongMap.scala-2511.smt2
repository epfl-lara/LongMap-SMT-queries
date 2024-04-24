; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38870 () Bool)

(assert start!38870)

(declare-fun b!406382 () Bool)

(declare-fun res!234766 () Bool)

(declare-fun e!244203 () Bool)

(assert (=> b!406382 (=> (not res!234766) (not e!244203))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24484 0))(
  ( (array!24485 (arr!11691 (Array (_ BitVec 32) (_ BitVec 64))) (size!12043 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24484)

(assert (=> b!406382 (= res!234766 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12043 _keys!709))))))

(declare-fun b!406383 () Bool)

(declare-fun e!244199 () Bool)

(assert (=> b!406383 (= e!244199 false)))

(declare-fun lt!188508 () Bool)

(declare-fun lt!188507 () array!24484)

(declare-datatypes ((List!6669 0))(
  ( (Nil!6666) (Cons!6665 (h!7521 (_ BitVec 64)) (t!11835 List!6669)) )
))
(declare-fun arrayNoDuplicates!0 (array!24484 (_ BitVec 32) List!6669) Bool)

(assert (=> b!406383 (= lt!188508 (arrayNoDuplicates!0 lt!188507 #b00000000000000000000000000000000 Nil!6666))))

(declare-fun b!406384 () Bool)

(declare-fun res!234773 () Bool)

(assert (=> b!406384 (=> (not res!234773) (not e!244203))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406384 (= res!234773 (validMask!0 mask!1025))))

(declare-fun b!406385 () Bool)

(declare-fun res!234769 () Bool)

(assert (=> b!406385 (=> (not res!234769) (not e!244203))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406385 (= res!234769 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406386 () Bool)

(declare-fun res!234774 () Bool)

(assert (=> b!406386 (=> (not res!234774) (not e!244203))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14843 0))(
  ( (V!14844 (val!5196 Int)) )
))
(declare-datatypes ((ValueCell!4808 0))(
  ( (ValueCellFull!4808 (v!7444 V!14843)) (EmptyCell!4808) )
))
(declare-datatypes ((array!24486 0))(
  ( (array!24487 (arr!11692 (Array (_ BitVec 32) ValueCell!4808)) (size!12044 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24486)

(assert (=> b!406386 (= res!234774 (and (= (size!12044 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12043 _keys!709) (size!12044 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406387 () Bool)

(declare-fun res!234771 () Bool)

(assert (=> b!406387 (=> (not res!234771) (not e!244203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24484 (_ BitVec 32)) Bool)

(assert (=> b!406387 (= res!234771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406388 () Bool)

(declare-fun res!234768 () Bool)

(assert (=> b!406388 (=> (not res!234768) (not e!244203))))

(assert (=> b!406388 (= res!234768 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6666))))

(declare-fun mapNonEmpty!17076 () Bool)

(declare-fun mapRes!17076 () Bool)

(declare-fun tp!33195 () Bool)

(declare-fun e!244200 () Bool)

(assert (=> mapNonEmpty!17076 (= mapRes!17076 (and tp!33195 e!244200))))

(declare-fun mapRest!17076 () (Array (_ BitVec 32) ValueCell!4808))

(declare-fun mapValue!17076 () ValueCell!4808)

(declare-fun mapKey!17076 () (_ BitVec 32))

(assert (=> mapNonEmpty!17076 (= (arr!11692 _values!549) (store mapRest!17076 mapKey!17076 mapValue!17076))))

(declare-fun b!406381 () Bool)

(declare-fun e!244202 () Bool)

(declare-fun tp_is_empty!10303 () Bool)

(assert (=> b!406381 (= e!244202 tp_is_empty!10303)))

(declare-fun res!234767 () Bool)

(assert (=> start!38870 (=> (not res!234767) (not e!244203))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38870 (= res!234767 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12043 _keys!709))))))

(assert (=> start!38870 e!244203))

(assert (=> start!38870 true))

(declare-fun e!244204 () Bool)

(declare-fun array_inv!8632 (array!24486) Bool)

(assert (=> start!38870 (and (array_inv!8632 _values!549) e!244204)))

(declare-fun array_inv!8633 (array!24484) Bool)

(assert (=> start!38870 (array_inv!8633 _keys!709)))

(declare-fun b!406389 () Bool)

(assert (=> b!406389 (= e!244203 e!244199)))

(declare-fun res!234765 () Bool)

(assert (=> b!406389 (=> (not res!234765) (not e!244199))))

(assert (=> b!406389 (= res!234765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188507 mask!1025))))

(assert (=> b!406389 (= lt!188507 (array!24485 (store (arr!11691 _keys!709) i!563 k0!794) (size!12043 _keys!709)))))

(declare-fun b!406390 () Bool)

(assert (=> b!406390 (= e!244200 tp_is_empty!10303)))

(declare-fun b!406391 () Bool)

(declare-fun res!234770 () Bool)

(assert (=> b!406391 (=> (not res!234770) (not e!244203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406391 (= res!234770 (validKeyInArray!0 k0!794))))

(declare-fun b!406392 () Bool)

(assert (=> b!406392 (= e!244204 (and e!244202 mapRes!17076))))

(declare-fun condMapEmpty!17076 () Bool)

(declare-fun mapDefault!17076 () ValueCell!4808)

(assert (=> b!406392 (= condMapEmpty!17076 (= (arr!11692 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4808)) mapDefault!17076)))))

(declare-fun mapIsEmpty!17076 () Bool)

(assert (=> mapIsEmpty!17076 mapRes!17076))

(declare-fun b!406393 () Bool)

(declare-fun res!234772 () Bool)

(assert (=> b!406393 (=> (not res!234772) (not e!244203))))

(assert (=> b!406393 (= res!234772 (or (= (select (arr!11691 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11691 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38870 res!234767) b!406384))

(assert (= (and b!406384 res!234773) b!406386))

(assert (= (and b!406386 res!234774) b!406387))

(assert (= (and b!406387 res!234771) b!406388))

(assert (= (and b!406388 res!234768) b!406382))

(assert (= (and b!406382 res!234766) b!406391))

(assert (= (and b!406391 res!234770) b!406393))

(assert (= (and b!406393 res!234772) b!406385))

(assert (= (and b!406385 res!234769) b!406389))

(assert (= (and b!406389 res!234765) b!406383))

(assert (= (and b!406392 condMapEmpty!17076) mapIsEmpty!17076))

(assert (= (and b!406392 (not condMapEmpty!17076)) mapNonEmpty!17076))

(get-info :version)

(assert (= (and mapNonEmpty!17076 ((_ is ValueCellFull!4808) mapValue!17076)) b!406390))

(assert (= (and b!406392 ((_ is ValueCellFull!4808) mapDefault!17076)) b!406381))

(assert (= start!38870 b!406392))

(declare-fun m!398733 () Bool)

(assert (=> b!406389 m!398733))

(declare-fun m!398735 () Bool)

(assert (=> b!406389 m!398735))

(declare-fun m!398737 () Bool)

(assert (=> b!406387 m!398737))

(declare-fun m!398739 () Bool)

(assert (=> b!406391 m!398739))

(declare-fun m!398741 () Bool)

(assert (=> start!38870 m!398741))

(declare-fun m!398743 () Bool)

(assert (=> start!38870 m!398743))

(declare-fun m!398745 () Bool)

(assert (=> b!406384 m!398745))

(declare-fun m!398747 () Bool)

(assert (=> b!406385 m!398747))

(declare-fun m!398749 () Bool)

(assert (=> mapNonEmpty!17076 m!398749))

(declare-fun m!398751 () Bool)

(assert (=> b!406383 m!398751))

(declare-fun m!398753 () Bool)

(assert (=> b!406388 m!398753))

(declare-fun m!398755 () Bool)

(assert (=> b!406393 m!398755))

(check-sat (not mapNonEmpty!17076) (not b!406385) (not start!38870) (not b!406383) tp_is_empty!10303 (not b!406387) (not b!406388) (not b!406384) (not b!406391) (not b!406389))
(check-sat)
