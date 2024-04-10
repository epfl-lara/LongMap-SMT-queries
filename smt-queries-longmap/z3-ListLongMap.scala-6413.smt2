; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82276 () Bool)

(assert start!82276)

(declare-fun b_free!18549 () Bool)

(declare-fun b_next!18549 () Bool)

(assert (=> start!82276 (= b_free!18549 (not b_next!18549))))

(declare-fun tp!64607 () Bool)

(declare-fun b_and!30037 () Bool)

(assert (=> start!82276 (= tp!64607 b_and!30037)))

(declare-fun b!959122 () Bool)

(declare-fun e!540689 () Bool)

(declare-fun tp_is_empty!21255 () Bool)

(assert (=> b!959122 (= e!540689 tp_is_empty!21255)))

(declare-fun b!959123 () Bool)

(declare-fun e!540687 () Bool)

(assert (=> b!959123 (= e!540687 (not true))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33323 0))(
  ( (V!33324 (val!10678 Int)) )
))
(declare-fun minValue!1328 () V!33323)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10146 0))(
  ( (ValueCellFull!10146 (v!13235 V!33323)) (EmptyCell!10146) )
))
(declare-datatypes ((array!58607 0))(
  ( (array!58608 (arr!28177 (Array (_ BitVec 32) ValueCell!10146)) (size!28656 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58607)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33323)

(declare-fun i!793 () (_ BitVec 32))

(declare-datatypes ((array!58609 0))(
  ( (array!58610 (arr!28178 (Array (_ BitVec 32) (_ BitVec 64))) (size!28657 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58609)

(declare-datatypes ((tuple2!13772 0))(
  ( (tuple2!13773 (_1!6897 (_ BitVec 64)) (_2!6897 V!33323)) )
))
(declare-datatypes ((List!19591 0))(
  ( (Nil!19588) (Cons!19587 (h!20749 tuple2!13772) (t!27954 List!19591)) )
))
(declare-datatypes ((ListLongMap!12469 0))(
  ( (ListLongMap!12470 (toList!6250 List!19591)) )
))
(declare-fun contains!5351 (ListLongMap!12469 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3483 (array!58609 array!58607 (_ BitVec 32) (_ BitVec 32) V!33323 V!33323 (_ BitVec 32) Int) ListLongMap!12469)

(assert (=> b!959123 (contains!5351 (getCurrentListMap!3483 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28178 _keys!1668) i!793))))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((Unit!32175 0))(
  ( (Unit!32176) )
))
(declare-fun lt!430515 () Unit!32175)

(declare-fun lemmaInListMapFromThenInFromSmaller!9 (array!58609 array!58607 (_ BitVec 32) (_ BitVec 32) V!33323 V!33323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32175)

(assert (=> b!959123 (= lt!430515 (lemmaInListMapFromThenInFromSmaller!9 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959124 () Bool)

(declare-fun res!642012 () Bool)

(assert (=> b!959124 (=> (not res!642012) (not e!540687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959124 (= res!642012 (validKeyInArray!0 (select (arr!28178 _keys!1668) i!793)))))

(declare-fun res!642016 () Bool)

(assert (=> start!82276 (=> (not res!642016) (not e!540687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82276 (= res!642016 (validMask!0 mask!2088))))

(assert (=> start!82276 e!540687))

(assert (=> start!82276 true))

(assert (=> start!82276 tp_is_empty!21255))

(declare-fun array_inv!21843 (array!58609) Bool)

(assert (=> start!82276 (array_inv!21843 _keys!1668)))

(declare-fun e!540688 () Bool)

(declare-fun array_inv!21844 (array!58607) Bool)

(assert (=> start!82276 (and (array_inv!21844 _values!1386) e!540688)))

(assert (=> start!82276 tp!64607))

(declare-fun mapIsEmpty!33862 () Bool)

(declare-fun mapRes!33862 () Bool)

(assert (=> mapIsEmpty!33862 mapRes!33862))

(declare-fun b!959125 () Bool)

(declare-fun res!642013 () Bool)

(assert (=> b!959125 (=> (not res!642013) (not e!540687))))

(declare-datatypes ((List!19592 0))(
  ( (Nil!19589) (Cons!19588 (h!20750 (_ BitVec 64)) (t!27955 List!19592)) )
))
(declare-fun arrayNoDuplicates!0 (array!58609 (_ BitVec 32) List!19592) Bool)

(assert (=> b!959125 (= res!642013 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19589))))

(declare-fun mapNonEmpty!33862 () Bool)

(declare-fun tp!64608 () Bool)

(declare-fun e!540690 () Bool)

(assert (=> mapNonEmpty!33862 (= mapRes!33862 (and tp!64608 e!540690))))

(declare-fun mapValue!33862 () ValueCell!10146)

(declare-fun mapKey!33862 () (_ BitVec 32))

(declare-fun mapRest!33862 () (Array (_ BitVec 32) ValueCell!10146))

(assert (=> mapNonEmpty!33862 (= (arr!28177 _values!1386) (store mapRest!33862 mapKey!33862 mapValue!33862))))

(declare-fun b!959126 () Bool)

(declare-fun res!642011 () Bool)

(assert (=> b!959126 (=> (not res!642011) (not e!540687))))

(assert (=> b!959126 (= res!642011 (contains!5351 (getCurrentListMap!3483 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28178 _keys!1668) i!793)))))

(declare-fun b!959127 () Bool)

(assert (=> b!959127 (= e!540690 tp_is_empty!21255)))

(declare-fun b!959128 () Bool)

(declare-fun res!642014 () Bool)

(assert (=> b!959128 (=> (not res!642014) (not e!540687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58609 (_ BitVec 32)) Bool)

(assert (=> b!959128 (= res!642014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959129 () Bool)

(declare-fun res!642015 () Bool)

(assert (=> b!959129 (=> (not res!642015) (not e!540687))))

(assert (=> b!959129 (= res!642015 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28657 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28657 _keys!1668))))))

(declare-fun b!959130 () Bool)

(assert (=> b!959130 (= e!540688 (and e!540689 mapRes!33862))))

(declare-fun condMapEmpty!33862 () Bool)

(declare-fun mapDefault!33862 () ValueCell!10146)

(assert (=> b!959130 (= condMapEmpty!33862 (= (arr!28177 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10146)) mapDefault!33862)))))

(declare-fun b!959131 () Bool)

(declare-fun res!642017 () Bool)

(assert (=> b!959131 (=> (not res!642017) (not e!540687))))

(assert (=> b!959131 (= res!642017 (and (= (size!28656 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28657 _keys!1668) (size!28656 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(assert (= (and start!82276 res!642016) b!959131))

(assert (= (and b!959131 res!642017) b!959128))

(assert (= (and b!959128 res!642014) b!959125))

(assert (= (and b!959125 res!642013) b!959129))

(assert (= (and b!959129 res!642015) b!959124))

(assert (= (and b!959124 res!642012) b!959126))

(assert (= (and b!959126 res!642011) b!959123))

(assert (= (and b!959130 condMapEmpty!33862) mapIsEmpty!33862))

(assert (= (and b!959130 (not condMapEmpty!33862)) mapNonEmpty!33862))

(get-info :version)

(assert (= (and mapNonEmpty!33862 ((_ is ValueCellFull!10146) mapValue!33862)) b!959127))

(assert (= (and b!959130 ((_ is ValueCellFull!10146) mapDefault!33862)) b!959122))

(assert (= start!82276 b!959130))

(declare-fun m!889657 () Bool)

(assert (=> b!959128 m!889657))

(declare-fun m!889659 () Bool)

(assert (=> mapNonEmpty!33862 m!889659))

(declare-fun m!889661 () Bool)

(assert (=> b!959126 m!889661))

(declare-fun m!889663 () Bool)

(assert (=> b!959126 m!889663))

(assert (=> b!959126 m!889661))

(assert (=> b!959126 m!889663))

(declare-fun m!889665 () Bool)

(assert (=> b!959126 m!889665))

(assert (=> b!959124 m!889663))

(assert (=> b!959124 m!889663))

(declare-fun m!889667 () Bool)

(assert (=> b!959124 m!889667))

(declare-fun m!889669 () Bool)

(assert (=> start!82276 m!889669))

(declare-fun m!889671 () Bool)

(assert (=> start!82276 m!889671))

(declare-fun m!889673 () Bool)

(assert (=> start!82276 m!889673))

(declare-fun m!889675 () Bool)

(assert (=> b!959125 m!889675))

(declare-fun m!889677 () Bool)

(assert (=> b!959123 m!889677))

(assert (=> b!959123 m!889663))

(assert (=> b!959123 m!889677))

(assert (=> b!959123 m!889663))

(declare-fun m!889679 () Bool)

(assert (=> b!959123 m!889679))

(declare-fun m!889681 () Bool)

(assert (=> b!959123 m!889681))

(check-sat (not mapNonEmpty!33862) (not b!959128) tp_is_empty!21255 (not b!959125) b_and!30037 (not b_next!18549) (not start!82276) (not b!959123) (not b!959126) (not b!959124))
(check-sat b_and!30037 (not b_next!18549))
