; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40422 () Bool)

(assert start!40422)

(declare-fun b!444577 () Bool)

(declare-fun res!263729 () Bool)

(declare-fun e!261389 () Bool)

(assert (=> b!444577 (=> (not res!263729) (not e!261389))))

(declare-datatypes ((array!27455 0))(
  ( (array!27456 (arr!13175 (Array (_ BitVec 32) (_ BitVec 64))) (size!13528 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27455)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16867 0))(
  ( (V!16868 (val!5955 Int)) )
))
(declare-datatypes ((ValueCell!5567 0))(
  ( (ValueCellFull!5567 (v!8200 V!16867)) (EmptyCell!5567) )
))
(declare-datatypes ((array!27457 0))(
  ( (array!27458 (arr!13176 (Array (_ BitVec 32) ValueCell!5567)) (size!13529 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27457)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!444577 (= res!263729 (and (= (size!13529 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13528 _keys!709) (size!13529 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444578 () Bool)

(declare-fun e!261392 () Bool)

(declare-fun tp_is_empty!11821 () Bool)

(assert (=> b!444578 (= e!261392 tp_is_empty!11821)))

(declare-fun b!444579 () Bool)

(declare-fun e!261388 () Bool)

(declare-fun mapRes!19359 () Bool)

(assert (=> b!444579 (= e!261388 (and e!261392 mapRes!19359))))

(declare-fun condMapEmpty!19359 () Bool)

(declare-fun mapDefault!19359 () ValueCell!5567)

(assert (=> b!444579 (= condMapEmpty!19359 (= (arr!13176 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5567)) mapDefault!19359)))))

(declare-fun mapNonEmpty!19359 () Bool)

(declare-fun tp!37341 () Bool)

(declare-fun e!261391 () Bool)

(assert (=> mapNonEmpty!19359 (= mapRes!19359 (and tp!37341 e!261391))))

(declare-fun mapKey!19359 () (_ BitVec 32))

(declare-fun mapValue!19359 () ValueCell!5567)

(declare-fun mapRest!19359 () (Array (_ BitVec 32) ValueCell!5567))

(assert (=> mapNonEmpty!19359 (= (arr!13176 _values!549) (store mapRest!19359 mapKey!19359 mapValue!19359))))

(declare-fun b!444580 () Bool)

(declare-fun e!261390 () Bool)

(assert (=> b!444580 (= e!261390 false)))

(declare-fun lt!203320 () Bool)

(declare-fun lt!203321 () array!27455)

(declare-datatypes ((List!7885 0))(
  ( (Nil!7882) (Cons!7881 (h!8737 (_ BitVec 64)) (t!13634 List!7885)) )
))
(declare-fun arrayNoDuplicates!0 (array!27455 (_ BitVec 32) List!7885) Bool)

(assert (=> b!444580 (= lt!203320 (arrayNoDuplicates!0 lt!203321 #b00000000000000000000000000000000 Nil!7882))))

(declare-fun b!444581 () Bool)

(declare-fun res!263726 () Bool)

(assert (=> b!444581 (=> (not res!263726) (not e!261389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27455 (_ BitVec 32)) Bool)

(assert (=> b!444581 (= res!263726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19359 () Bool)

(assert (=> mapIsEmpty!19359 mapRes!19359))

(declare-fun b!444582 () Bool)

(declare-fun res!263722 () Bool)

(assert (=> b!444582 (=> (not res!263722) (not e!261389))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444582 (= res!263722 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13528 _keys!709))))))

(declare-fun b!444583 () Bool)

(declare-fun res!263728 () Bool)

(assert (=> b!444583 (=> (not res!263728) (not e!261389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444583 (= res!263728 (validMask!0 mask!1025))))

(declare-fun res!263723 () Bool)

(assert (=> start!40422 (=> (not res!263723) (not e!261389))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40422 (= res!263723 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13528 _keys!709))))))

(assert (=> start!40422 e!261389))

(assert (=> start!40422 true))

(declare-fun array_inv!9608 (array!27457) Bool)

(assert (=> start!40422 (and (array_inv!9608 _values!549) e!261388)))

(declare-fun array_inv!9609 (array!27455) Bool)

(assert (=> start!40422 (array_inv!9609 _keys!709)))

(declare-fun b!444584 () Bool)

(assert (=> b!444584 (= e!261389 e!261390)))

(declare-fun res!263727 () Bool)

(assert (=> b!444584 (=> (not res!263727) (not e!261390))))

(assert (=> b!444584 (= res!263727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203321 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!444584 (= lt!203321 (array!27456 (store (arr!13175 _keys!709) i!563 k0!794) (size!13528 _keys!709)))))

(declare-fun b!444585 () Bool)

(declare-fun res!263724 () Bool)

(assert (=> b!444585 (=> (not res!263724) (not e!261389))))

(assert (=> b!444585 (= res!263724 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7882))))

(declare-fun b!444586 () Bool)

(declare-fun res!263731 () Bool)

(assert (=> b!444586 (=> (not res!263731) (not e!261389))))

(declare-fun arrayContainsKey!0 (array!27455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444586 (= res!263731 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444587 () Bool)

(declare-fun res!263730 () Bool)

(assert (=> b!444587 (=> (not res!263730) (not e!261389))))

(assert (=> b!444587 (= res!263730 (or (= (select (arr!13175 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13175 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444588 () Bool)

(declare-fun res!263725 () Bool)

(assert (=> b!444588 (=> (not res!263725) (not e!261389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444588 (= res!263725 (validKeyInArray!0 k0!794))))

(declare-fun b!444589 () Bool)

(assert (=> b!444589 (= e!261391 tp_is_empty!11821)))

(assert (= (and start!40422 res!263723) b!444583))

(assert (= (and b!444583 res!263728) b!444577))

(assert (= (and b!444577 res!263729) b!444581))

(assert (= (and b!444581 res!263726) b!444585))

(assert (= (and b!444585 res!263724) b!444582))

(assert (= (and b!444582 res!263722) b!444588))

(assert (= (and b!444588 res!263725) b!444587))

(assert (= (and b!444587 res!263730) b!444586))

(assert (= (and b!444586 res!263731) b!444584))

(assert (= (and b!444584 res!263727) b!444580))

(assert (= (and b!444579 condMapEmpty!19359) mapIsEmpty!19359))

(assert (= (and b!444579 (not condMapEmpty!19359)) mapNonEmpty!19359))

(get-info :version)

(assert (= (and mapNonEmpty!19359 ((_ is ValueCellFull!5567) mapValue!19359)) b!444589))

(assert (= (and b!444579 ((_ is ValueCellFull!5567) mapDefault!19359)) b!444578))

(assert (= start!40422 b!444579))

(declare-fun m!429841 () Bool)

(assert (=> b!444588 m!429841))

(declare-fun m!429843 () Bool)

(assert (=> b!444584 m!429843))

(declare-fun m!429845 () Bool)

(assert (=> b!444584 m!429845))

(declare-fun m!429847 () Bool)

(assert (=> b!444585 m!429847))

(declare-fun m!429849 () Bool)

(assert (=> b!444586 m!429849))

(declare-fun m!429851 () Bool)

(assert (=> b!444587 m!429851))

(declare-fun m!429853 () Bool)

(assert (=> mapNonEmpty!19359 m!429853))

(declare-fun m!429855 () Bool)

(assert (=> b!444580 m!429855))

(declare-fun m!429857 () Bool)

(assert (=> b!444581 m!429857))

(declare-fun m!429859 () Bool)

(assert (=> start!40422 m!429859))

(declare-fun m!429861 () Bool)

(assert (=> start!40422 m!429861))

(declare-fun m!429863 () Bool)

(assert (=> b!444583 m!429863))

(check-sat (not b!444581) (not b!444586) (not b!444584) (not b!444588) (not b!444580) (not start!40422) (not mapNonEmpty!19359) (not b!444583) (not b!444585) tp_is_empty!11821)
(check-sat)
