; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40536 () Bool)

(assert start!40536)

(declare-fun b!446741 () Bool)

(declare-fun res!265221 () Bool)

(declare-fun e!262417 () Bool)

(assert (=> b!446741 (=> (not res!265221) (not e!262417))))

(declare-datatypes ((array!27607 0))(
  ( (array!27608 (arr!13250 (Array (_ BitVec 32) (_ BitVec 64))) (size!13602 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27607)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27607 (_ BitVec 32)) Bool)

(assert (=> b!446741 (= res!265221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446742 () Bool)

(declare-fun res!265222 () Bool)

(assert (=> b!446742 (=> (not res!265222) (not e!262417))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446742 (= res!265222 (or (= (select (arr!13250 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13250 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446743 () Bool)

(declare-fun res!265224 () Bool)

(declare-fun e!262422 () Bool)

(assert (=> b!446743 (=> (not res!265224) (not e!262422))))

(declare-fun lt!203849 () array!27607)

(declare-datatypes ((List!7925 0))(
  ( (Nil!7922) (Cons!7921 (h!8777 (_ BitVec 64)) (t!13685 List!7925)) )
))
(declare-fun arrayNoDuplicates!0 (array!27607 (_ BitVec 32) List!7925) Bool)

(assert (=> b!446743 (= res!265224 (arrayNoDuplicates!0 lt!203849 #b00000000000000000000000000000000 Nil!7922))))

(declare-fun b!446744 () Bool)

(declare-fun res!265214 () Bool)

(assert (=> b!446744 (=> (not res!265214) (not e!262417))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446744 (= res!265214 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446745 () Bool)

(declare-fun e!262421 () Bool)

(declare-fun tp_is_empty!11901 () Bool)

(assert (=> b!446745 (= e!262421 tp_is_empty!11901)))

(declare-fun b!446746 () Bool)

(declare-fun res!265223 () Bool)

(assert (=> b!446746 (=> (not res!265223) (not e!262417))))

(assert (=> b!446746 (= res!265223 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7922))))

(declare-fun b!446747 () Bool)

(declare-fun res!265217 () Bool)

(assert (=> b!446747 (=> (not res!265217) (not e!262417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446747 (= res!265217 (validKeyInArray!0 k0!794))))

(declare-fun b!446748 () Bool)

(declare-fun e!262418 () Bool)

(declare-fun mapRes!19482 () Bool)

(assert (=> b!446748 (= e!262418 (and e!262421 mapRes!19482))))

(declare-fun condMapEmpty!19482 () Bool)

(declare-datatypes ((V!16973 0))(
  ( (V!16974 (val!5995 Int)) )
))
(declare-datatypes ((ValueCell!5607 0))(
  ( (ValueCellFull!5607 (v!8250 V!16973)) (EmptyCell!5607) )
))
(declare-datatypes ((array!27609 0))(
  ( (array!27610 (arr!13251 (Array (_ BitVec 32) ValueCell!5607)) (size!13603 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27609)

(declare-fun mapDefault!19482 () ValueCell!5607)

(assert (=> b!446748 (= condMapEmpty!19482 (= (arr!13251 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5607)) mapDefault!19482)))))

(declare-fun b!446749 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!446749 (= e!262422 (and (bvsgt from!863 i!563) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13602 _keys!709)) (bvsge i!563 (size!13603 _values!549))))))

(declare-fun b!446750 () Bool)

(declare-fun res!265216 () Bool)

(assert (=> b!446750 (=> (not res!265216) (not e!262417))))

(assert (=> b!446750 (= res!265216 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13602 _keys!709))))))

(declare-fun b!446751 () Bool)

(assert (=> b!446751 (= e!262417 e!262422)))

(declare-fun res!265219 () Bool)

(assert (=> b!446751 (=> (not res!265219) (not e!262422))))

(assert (=> b!446751 (= res!265219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203849 mask!1025))))

(assert (=> b!446751 (= lt!203849 (array!27608 (store (arr!13250 _keys!709) i!563 k0!794) (size!13602 _keys!709)))))

(declare-fun res!265220 () Bool)

(assert (=> start!40536 (=> (not res!265220) (not e!262417))))

(assert (=> start!40536 (= res!265220 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13602 _keys!709))))))

(assert (=> start!40536 e!262417))

(assert (=> start!40536 true))

(declare-fun array_inv!9608 (array!27609) Bool)

(assert (=> start!40536 (and (array_inv!9608 _values!549) e!262418)))

(declare-fun array_inv!9609 (array!27607) Bool)

(assert (=> start!40536 (array_inv!9609 _keys!709)))

(declare-fun b!446752 () Bool)

(declare-fun e!262419 () Bool)

(assert (=> b!446752 (= e!262419 tp_is_empty!11901)))

(declare-fun mapNonEmpty!19482 () Bool)

(declare-fun tp!37509 () Bool)

(assert (=> mapNonEmpty!19482 (= mapRes!19482 (and tp!37509 e!262419))))

(declare-fun mapRest!19482 () (Array (_ BitVec 32) ValueCell!5607))

(declare-fun mapValue!19482 () ValueCell!5607)

(declare-fun mapKey!19482 () (_ BitVec 32))

(assert (=> mapNonEmpty!19482 (= (arr!13251 _values!549) (store mapRest!19482 mapKey!19482 mapValue!19482))))

(declare-fun b!446753 () Bool)

(declare-fun res!265218 () Bool)

(assert (=> b!446753 (=> (not res!265218) (not e!262417))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!446753 (= res!265218 (and (= (size!13603 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13602 _keys!709) (size!13603 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19482 () Bool)

(assert (=> mapIsEmpty!19482 mapRes!19482))

(declare-fun b!446754 () Bool)

(declare-fun res!265215 () Bool)

(assert (=> b!446754 (=> (not res!265215) (not e!262417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446754 (= res!265215 (validMask!0 mask!1025))))

(assert (= (and start!40536 res!265220) b!446754))

(assert (= (and b!446754 res!265215) b!446753))

(assert (= (and b!446753 res!265218) b!446741))

(assert (= (and b!446741 res!265221) b!446746))

(assert (= (and b!446746 res!265223) b!446750))

(assert (= (and b!446750 res!265216) b!446747))

(assert (= (and b!446747 res!265217) b!446742))

(assert (= (and b!446742 res!265222) b!446744))

(assert (= (and b!446744 res!265214) b!446751))

(assert (= (and b!446751 res!265219) b!446743))

(assert (= (and b!446743 res!265224) b!446749))

(assert (= (and b!446748 condMapEmpty!19482) mapIsEmpty!19482))

(assert (= (and b!446748 (not condMapEmpty!19482)) mapNonEmpty!19482))

(get-info :version)

(assert (= (and mapNonEmpty!19482 ((_ is ValueCellFull!5607) mapValue!19482)) b!446752))

(assert (= (and b!446748 ((_ is ValueCellFull!5607) mapDefault!19482)) b!446745))

(assert (= start!40536 b!446748))

(declare-fun m!431865 () Bool)

(assert (=> b!446743 m!431865))

(declare-fun m!431867 () Bool)

(assert (=> b!446742 m!431867))

(declare-fun m!431869 () Bool)

(assert (=> mapNonEmpty!19482 m!431869))

(declare-fun m!431871 () Bool)

(assert (=> b!446751 m!431871))

(declare-fun m!431873 () Bool)

(assert (=> b!446751 m!431873))

(declare-fun m!431875 () Bool)

(assert (=> start!40536 m!431875))

(declare-fun m!431877 () Bool)

(assert (=> start!40536 m!431877))

(declare-fun m!431879 () Bool)

(assert (=> b!446741 m!431879))

(declare-fun m!431881 () Bool)

(assert (=> b!446744 m!431881))

(declare-fun m!431883 () Bool)

(assert (=> b!446746 m!431883))

(declare-fun m!431885 () Bool)

(assert (=> b!446747 m!431885))

(declare-fun m!431887 () Bool)

(assert (=> b!446754 m!431887))

(check-sat (not b!446751) tp_is_empty!11901 (not b!446744) (not b!446747) (not start!40536) (not b!446743) (not mapNonEmpty!19482) (not b!446741) (not b!446746) (not b!446754))
(check-sat)
