; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40432 () Bool)

(assert start!40432)

(declare-fun mapNonEmpty!19353 () Bool)

(declare-fun mapRes!19353 () Bool)

(declare-fun tp!37335 () Bool)

(declare-fun e!261528 () Bool)

(assert (=> mapNonEmpty!19353 (= mapRes!19353 (and tp!37335 e!261528))))

(declare-datatypes ((V!16861 0))(
  ( (V!16862 (val!5953 Int)) )
))
(declare-datatypes ((ValueCell!5565 0))(
  ( (ValueCellFull!5565 (v!8204 V!16861)) (EmptyCell!5565) )
))
(declare-fun mapValue!19353 () ValueCell!5565)

(declare-datatypes ((array!27441 0))(
  ( (array!27442 (arr!13168 (Array (_ BitVec 32) ValueCell!5565)) (size!13520 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27441)

(declare-fun mapKey!19353 () (_ BitVec 32))

(declare-fun mapRest!19353 () (Array (_ BitVec 32) ValueCell!5565))

(assert (=> mapNonEmpty!19353 (= (arr!13168 _values!549) (store mapRest!19353 mapKey!19353 mapValue!19353))))

(declare-fun res!263797 () Bool)

(declare-fun e!261527 () Bool)

(assert (=> start!40432 (=> (not res!263797) (not e!261527))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27443 0))(
  ( (array!27444 (arr!13169 (Array (_ BitVec 32) (_ BitVec 64))) (size!13521 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27443)

(assert (=> start!40432 (= res!263797 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13521 _keys!709))))))

(assert (=> start!40432 e!261527))

(assert (=> start!40432 true))

(declare-fun e!261525 () Bool)

(declare-fun array_inv!9548 (array!27441) Bool)

(assert (=> start!40432 (and (array_inv!9548 _values!549) e!261525)))

(declare-fun array_inv!9549 (array!27443) Bool)

(assert (=> start!40432 (array_inv!9549 _keys!709)))

(declare-fun b!444770 () Bool)

(declare-fun res!263795 () Bool)

(assert (=> b!444770 (=> (not res!263795) (not e!261527))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444770 (= res!263795 (or (= (select (arr!13169 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13169 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444771 () Bool)

(declare-fun tp_is_empty!11817 () Bool)

(assert (=> b!444771 (= e!261528 tp_is_empty!11817)))

(declare-fun b!444772 () Bool)

(declare-fun res!263796 () Bool)

(assert (=> b!444772 (=> (not res!263796) (not e!261527))))

(assert (=> b!444772 (= res!263796 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13521 _keys!709))))))

(declare-fun b!444773 () Bool)

(declare-fun e!261530 () Bool)

(assert (=> b!444773 (= e!261527 e!261530)))

(declare-fun res!263794 () Bool)

(assert (=> b!444773 (=> (not res!263794) (not e!261530))))

(declare-fun lt!203542 () array!27443)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27443 (_ BitVec 32)) Bool)

(assert (=> b!444773 (= res!263794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203542 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!444773 (= lt!203542 (array!27444 (store (arr!13169 _keys!709) i!563 k0!794) (size!13521 _keys!709)))))

(declare-fun b!444774 () Bool)

(declare-fun res!263798 () Bool)

(assert (=> b!444774 (=> (not res!263798) (not e!261527))))

(declare-fun arrayContainsKey!0 (array!27443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444774 (= res!263798 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444775 () Bool)

(declare-fun res!263793 () Bool)

(assert (=> b!444775 (=> (not res!263793) (not e!261527))))

(assert (=> b!444775 (= res!263793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444776 () Bool)

(declare-fun res!263791 () Bool)

(assert (=> b!444776 (=> (not res!263791) (not e!261527))))

(declare-datatypes ((List!7878 0))(
  ( (Nil!7875) (Cons!7874 (h!8730 (_ BitVec 64)) (t!13636 List!7878)) )
))
(declare-fun arrayNoDuplicates!0 (array!27443 (_ BitVec 32) List!7878) Bool)

(assert (=> b!444776 (= res!263791 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7875))))

(declare-fun b!444777 () Bool)

(declare-fun e!261526 () Bool)

(assert (=> b!444777 (= e!261526 tp_is_empty!11817)))

(declare-fun b!444778 () Bool)

(declare-fun res!263792 () Bool)

(assert (=> b!444778 (=> (not res!263792) (not e!261527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444778 (= res!263792 (validMask!0 mask!1025))))

(declare-fun b!444779 () Bool)

(assert (=> b!444779 (= e!261525 (and e!261526 mapRes!19353))))

(declare-fun condMapEmpty!19353 () Bool)

(declare-fun mapDefault!19353 () ValueCell!5565)

(assert (=> b!444779 (= condMapEmpty!19353 (= (arr!13168 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5565)) mapDefault!19353)))))

(declare-fun mapIsEmpty!19353 () Bool)

(assert (=> mapIsEmpty!19353 mapRes!19353))

(declare-fun b!444780 () Bool)

(declare-fun res!263800 () Bool)

(assert (=> b!444780 (=> (not res!263800) (not e!261527))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444780 (= res!263800 (and (= (size!13520 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13521 _keys!709) (size!13520 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444781 () Bool)

(assert (=> b!444781 (= e!261530 false)))

(declare-fun lt!203543 () Bool)

(assert (=> b!444781 (= lt!203543 (arrayNoDuplicates!0 lt!203542 #b00000000000000000000000000000000 Nil!7875))))

(declare-fun b!444782 () Bool)

(declare-fun res!263799 () Bool)

(assert (=> b!444782 (=> (not res!263799) (not e!261527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444782 (= res!263799 (validKeyInArray!0 k0!794))))

(assert (= (and start!40432 res!263797) b!444778))

(assert (= (and b!444778 res!263792) b!444780))

(assert (= (and b!444780 res!263800) b!444775))

(assert (= (and b!444775 res!263793) b!444776))

(assert (= (and b!444776 res!263791) b!444772))

(assert (= (and b!444772 res!263796) b!444782))

(assert (= (and b!444782 res!263799) b!444770))

(assert (= (and b!444770 res!263795) b!444774))

(assert (= (and b!444774 res!263798) b!444773))

(assert (= (and b!444773 res!263794) b!444781))

(assert (= (and b!444779 condMapEmpty!19353) mapIsEmpty!19353))

(assert (= (and b!444779 (not condMapEmpty!19353)) mapNonEmpty!19353))

(get-info :version)

(assert (= (and mapNonEmpty!19353 ((_ is ValueCellFull!5565) mapValue!19353)) b!444771))

(assert (= (and b!444779 ((_ is ValueCellFull!5565) mapDefault!19353)) b!444777))

(assert (= start!40432 b!444779))

(declare-fun m!430525 () Bool)

(assert (=> b!444781 m!430525))

(declare-fun m!430527 () Bool)

(assert (=> b!444778 m!430527))

(declare-fun m!430529 () Bool)

(assert (=> b!444782 m!430529))

(declare-fun m!430531 () Bool)

(assert (=> mapNonEmpty!19353 m!430531))

(declare-fun m!430533 () Bool)

(assert (=> b!444773 m!430533))

(declare-fun m!430535 () Bool)

(assert (=> b!444773 m!430535))

(declare-fun m!430537 () Bool)

(assert (=> start!40432 m!430537))

(declare-fun m!430539 () Bool)

(assert (=> start!40432 m!430539))

(declare-fun m!430541 () Bool)

(assert (=> b!444770 m!430541))

(declare-fun m!430543 () Bool)

(assert (=> b!444774 m!430543))

(declare-fun m!430545 () Bool)

(assert (=> b!444776 m!430545))

(declare-fun m!430547 () Bool)

(assert (=> b!444775 m!430547))

(check-sat (not mapNonEmpty!19353) (not b!444781) (not b!444782) (not b!444775) (not b!444773) tp_is_empty!11817 (not b!444774) (not b!444776) (not start!40432) (not b!444778))
(check-sat)
