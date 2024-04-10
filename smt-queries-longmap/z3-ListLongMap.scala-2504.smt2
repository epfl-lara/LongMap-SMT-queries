; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38844 () Bool)

(assert start!38844)

(declare-fun b!405650 () Bool)

(declare-fun e!243874 () Bool)

(declare-fun tp_is_empty!10263 () Bool)

(assert (=> b!405650 (= e!243874 tp_is_empty!10263)))

(declare-fun b!405651 () Bool)

(declare-fun res!234172 () Bool)

(declare-fun e!243871 () Bool)

(assert (=> b!405651 (=> (not res!234172) (not e!243871))))

(declare-datatypes ((array!24417 0))(
  ( (array!24418 (arr!11658 (Array (_ BitVec 32) (_ BitVec 64))) (size!12010 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24417)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405651 (= res!234172 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!405652 () Bool)

(declare-fun res!234176 () Bool)

(assert (=> b!405652 (=> (not res!234176) (not e!243871))))

(declare-datatypes ((List!6778 0))(
  ( (Nil!6775) (Cons!6774 (h!7630 (_ BitVec 64)) (t!11952 List!6778)) )
))
(declare-fun arrayNoDuplicates!0 (array!24417 (_ BitVec 32) List!6778) Bool)

(assert (=> b!405652 (= res!234176 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6775))))

(declare-fun b!405653 () Bool)

(declare-fun res!234175 () Bool)

(assert (=> b!405653 (=> (not res!234175) (not e!243871))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405653 (= res!234175 (or (= (select (arr!11658 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11658 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!234171 () Bool)

(assert (=> start!38844 (=> (not res!234171) (not e!243871))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38844 (= res!234171 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12010 _keys!709))))))

(assert (=> start!38844 e!243871))

(assert (=> start!38844 true))

(declare-datatypes ((V!14789 0))(
  ( (V!14790 (val!5176 Int)) )
))
(declare-datatypes ((ValueCell!4788 0))(
  ( (ValueCellFull!4788 (v!7423 V!14789)) (EmptyCell!4788) )
))
(declare-datatypes ((array!24419 0))(
  ( (array!24420 (arr!11659 (Array (_ BitVec 32) ValueCell!4788)) (size!12011 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24419)

(declare-fun e!243873 () Bool)

(declare-fun array_inv!8520 (array!24419) Bool)

(assert (=> start!38844 (and (array_inv!8520 _values!549) e!243873)))

(declare-fun array_inv!8521 (array!24417) Bool)

(assert (=> start!38844 (array_inv!8521 _keys!709)))

(declare-fun b!405654 () Bool)

(declare-fun res!234174 () Bool)

(assert (=> b!405654 (=> (not res!234174) (not e!243871))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24417 (_ BitVec 32)) Bool)

(assert (=> b!405654 (= res!234174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405655 () Bool)

(declare-fun e!243876 () Bool)

(assert (=> b!405655 (= e!243871 e!243876)))

(declare-fun res!234170 () Bool)

(assert (=> b!405655 (=> (not res!234170) (not e!243876))))

(declare-fun lt!188368 () array!24417)

(assert (=> b!405655 (= res!234170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188368 mask!1025))))

(assert (=> b!405655 (= lt!188368 (array!24418 (store (arr!11658 _keys!709) i!563 k0!794) (size!12010 _keys!709)))))

(declare-fun b!405656 () Bool)

(assert (=> b!405656 (= e!243876 false)))

(declare-fun lt!188369 () Bool)

(assert (=> b!405656 (= lt!188369 (arrayNoDuplicates!0 lt!188368 #b00000000000000000000000000000000 Nil!6775))))

(declare-fun mapIsEmpty!17016 () Bool)

(declare-fun mapRes!17016 () Bool)

(assert (=> mapIsEmpty!17016 mapRes!17016))

(declare-fun b!405657 () Bool)

(declare-fun res!234168 () Bool)

(assert (=> b!405657 (=> (not res!234168) (not e!243871))))

(assert (=> b!405657 (= res!234168 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12010 _keys!709))))))

(declare-fun b!405658 () Bool)

(assert (=> b!405658 (= e!243873 (and e!243874 mapRes!17016))))

(declare-fun condMapEmpty!17016 () Bool)

(declare-fun mapDefault!17016 () ValueCell!4788)

(assert (=> b!405658 (= condMapEmpty!17016 (= (arr!11659 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4788)) mapDefault!17016)))))

(declare-fun mapNonEmpty!17016 () Bool)

(declare-fun tp!33135 () Bool)

(declare-fun e!243872 () Bool)

(assert (=> mapNonEmpty!17016 (= mapRes!17016 (and tp!33135 e!243872))))

(declare-fun mapValue!17016 () ValueCell!4788)

(declare-fun mapRest!17016 () (Array (_ BitVec 32) ValueCell!4788))

(declare-fun mapKey!17016 () (_ BitVec 32))

(assert (=> mapNonEmpty!17016 (= (arr!11659 _values!549) (store mapRest!17016 mapKey!17016 mapValue!17016))))

(declare-fun b!405659 () Bool)

(declare-fun res!234169 () Bool)

(assert (=> b!405659 (=> (not res!234169) (not e!243871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405659 (= res!234169 (validMask!0 mask!1025))))

(declare-fun b!405660 () Bool)

(declare-fun res!234177 () Bool)

(assert (=> b!405660 (=> (not res!234177) (not e!243871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405660 (= res!234177 (validKeyInArray!0 k0!794))))

(declare-fun b!405661 () Bool)

(declare-fun res!234173 () Bool)

(assert (=> b!405661 (=> (not res!234173) (not e!243871))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405661 (= res!234173 (and (= (size!12011 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12010 _keys!709) (size!12011 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405662 () Bool)

(assert (=> b!405662 (= e!243872 tp_is_empty!10263)))

(assert (= (and start!38844 res!234171) b!405659))

(assert (= (and b!405659 res!234169) b!405661))

(assert (= (and b!405661 res!234173) b!405654))

(assert (= (and b!405654 res!234174) b!405652))

(assert (= (and b!405652 res!234176) b!405657))

(assert (= (and b!405657 res!234168) b!405660))

(assert (= (and b!405660 res!234177) b!405653))

(assert (= (and b!405653 res!234175) b!405651))

(assert (= (and b!405651 res!234172) b!405655))

(assert (= (and b!405655 res!234170) b!405656))

(assert (= (and b!405658 condMapEmpty!17016) mapIsEmpty!17016))

(assert (= (and b!405658 (not condMapEmpty!17016)) mapNonEmpty!17016))

(get-info :version)

(assert (= (and mapNonEmpty!17016 ((_ is ValueCellFull!4788) mapValue!17016)) b!405662))

(assert (= (and b!405658 ((_ is ValueCellFull!4788) mapDefault!17016)) b!405650))

(assert (= start!38844 b!405658))

(declare-fun m!398023 () Bool)

(assert (=> b!405654 m!398023))

(declare-fun m!398025 () Bool)

(assert (=> b!405652 m!398025))

(declare-fun m!398027 () Bool)

(assert (=> b!405659 m!398027))

(declare-fun m!398029 () Bool)

(assert (=> mapNonEmpty!17016 m!398029))

(declare-fun m!398031 () Bool)

(assert (=> b!405660 m!398031))

(declare-fun m!398033 () Bool)

(assert (=> b!405655 m!398033))

(declare-fun m!398035 () Bool)

(assert (=> b!405655 m!398035))

(declare-fun m!398037 () Bool)

(assert (=> b!405651 m!398037))

(declare-fun m!398039 () Bool)

(assert (=> b!405653 m!398039))

(declare-fun m!398041 () Bool)

(assert (=> start!38844 m!398041))

(declare-fun m!398043 () Bool)

(assert (=> start!38844 m!398043))

(declare-fun m!398045 () Bool)

(assert (=> b!405656 m!398045))

(check-sat (not b!405652) (not start!38844) (not b!405659) (not b!405660) (not b!405656) (not mapNonEmpty!17016) (not b!405654) (not b!405651) (not b!405655) tp_is_empty!10263)
(check-sat)
