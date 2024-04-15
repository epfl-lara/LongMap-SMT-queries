; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40502 () Bool)

(assert start!40502)

(declare-fun b!446075 () Bool)

(declare-fun res!264781 () Bool)

(declare-fun e!262068 () Bool)

(assert (=> b!446075 (=> (not res!264781) (not e!262068))))

(declare-datatypes ((array!27573 0))(
  ( (array!27574 (arr!13233 (Array (_ BitVec 32) (_ BitVec 64))) (size!13586 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27573)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446075 (= res!264781 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446076 () Bool)

(declare-fun res!264784 () Bool)

(assert (=> b!446076 (=> (not res!264784) (not e!262068))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16947 0))(
  ( (V!16948 (val!5985 Int)) )
))
(declare-datatypes ((ValueCell!5597 0))(
  ( (ValueCellFull!5597 (v!8234 V!16947)) (EmptyCell!5597) )
))
(declare-datatypes ((array!27575 0))(
  ( (array!27576 (arr!13234 (Array (_ BitVec 32) ValueCell!5597)) (size!13587 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27575)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!446076 (= res!264784 (and (= (size!13587 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13586 _keys!709) (size!13587 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446077 () Bool)

(declare-fun e!262064 () Bool)

(declare-fun tp_is_empty!11881 () Bool)

(assert (=> b!446077 (= e!262064 tp_is_empty!11881)))

(declare-fun b!446078 () Bool)

(declare-fun e!262063 () Bool)

(declare-fun mapRes!19452 () Bool)

(assert (=> b!446078 (= e!262063 (and e!262064 mapRes!19452))))

(declare-fun condMapEmpty!19452 () Bool)

(declare-fun mapDefault!19452 () ValueCell!5597)

(assert (=> b!446078 (= condMapEmpty!19452 (= (arr!13234 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5597)) mapDefault!19452)))))

(declare-fun mapIsEmpty!19452 () Bool)

(assert (=> mapIsEmpty!19452 mapRes!19452))

(declare-fun b!446079 () Bool)

(declare-fun e!262065 () Bool)

(assert (=> b!446079 (= e!262065 false)))

(declare-fun lt!203560 () Bool)

(declare-fun lt!203561 () array!27573)

(declare-datatypes ((List!7923 0))(
  ( (Nil!7920) (Cons!7919 (h!8775 (_ BitVec 64)) (t!13674 List!7923)) )
))
(declare-fun arrayNoDuplicates!0 (array!27573 (_ BitVec 32) List!7923) Bool)

(assert (=> b!446079 (= lt!203560 (arrayNoDuplicates!0 lt!203561 #b00000000000000000000000000000000 Nil!7920))))

(declare-fun b!446080 () Bool)

(declare-fun res!264785 () Bool)

(assert (=> b!446080 (=> (not res!264785) (not e!262068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27573 (_ BitVec 32)) Bool)

(assert (=> b!446080 (= res!264785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446081 () Bool)

(declare-fun e!262067 () Bool)

(assert (=> b!446081 (= e!262067 tp_is_empty!11881)))

(declare-fun b!446082 () Bool)

(declare-fun res!264789 () Bool)

(assert (=> b!446082 (=> (not res!264789) (not e!262068))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446082 (= res!264789 (or (= (select (arr!13233 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13233 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!264786 () Bool)

(assert (=> start!40502 (=> (not res!264786) (not e!262068))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40502 (= res!264786 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13586 _keys!709))))))

(assert (=> start!40502 e!262068))

(assert (=> start!40502 true))

(declare-fun array_inv!9646 (array!27575) Bool)

(assert (=> start!40502 (and (array_inv!9646 _values!549) e!262063)))

(declare-fun array_inv!9647 (array!27573) Bool)

(assert (=> start!40502 (array_inv!9647 _keys!709)))

(declare-fun b!446083 () Bool)

(declare-fun res!264788 () Bool)

(assert (=> b!446083 (=> (not res!264788) (not e!262068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446083 (= res!264788 (validKeyInArray!0 k0!794))))

(declare-fun b!446084 () Bool)

(declare-fun res!264783 () Bool)

(assert (=> b!446084 (=> (not res!264783) (not e!262068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446084 (= res!264783 (validMask!0 mask!1025))))

(declare-fun b!446085 () Bool)

(declare-fun res!264787 () Bool)

(assert (=> b!446085 (=> (not res!264787) (not e!262068))))

(assert (=> b!446085 (= res!264787 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13586 _keys!709))))))

(declare-fun b!446086 () Bool)

(declare-fun res!264782 () Bool)

(assert (=> b!446086 (=> (not res!264782) (not e!262068))))

(assert (=> b!446086 (= res!264782 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7920))))

(declare-fun b!446087 () Bool)

(assert (=> b!446087 (= e!262068 e!262065)))

(declare-fun res!264780 () Bool)

(assert (=> b!446087 (=> (not res!264780) (not e!262065))))

(assert (=> b!446087 (= res!264780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203561 mask!1025))))

(assert (=> b!446087 (= lt!203561 (array!27574 (store (arr!13233 _keys!709) i!563 k0!794) (size!13586 _keys!709)))))

(declare-fun mapNonEmpty!19452 () Bool)

(declare-fun tp!37479 () Bool)

(assert (=> mapNonEmpty!19452 (= mapRes!19452 (and tp!37479 e!262067))))

(declare-fun mapKey!19452 () (_ BitVec 32))

(declare-fun mapValue!19452 () ValueCell!5597)

(declare-fun mapRest!19452 () (Array (_ BitVec 32) ValueCell!5597))

(assert (=> mapNonEmpty!19452 (= (arr!13234 _values!549) (store mapRest!19452 mapKey!19452 mapValue!19452))))

(assert (= (and start!40502 res!264786) b!446084))

(assert (= (and b!446084 res!264783) b!446076))

(assert (= (and b!446076 res!264784) b!446080))

(assert (= (and b!446080 res!264785) b!446086))

(assert (= (and b!446086 res!264782) b!446085))

(assert (= (and b!446085 res!264787) b!446083))

(assert (= (and b!446083 res!264788) b!446082))

(assert (= (and b!446082 res!264789) b!446075))

(assert (= (and b!446075 res!264781) b!446087))

(assert (= (and b!446087 res!264780) b!446079))

(assert (= (and b!446078 condMapEmpty!19452) mapIsEmpty!19452))

(assert (= (and b!446078 (not condMapEmpty!19452)) mapNonEmpty!19452))

(get-info :version)

(assert (= (and mapNonEmpty!19452 ((_ is ValueCellFull!5597) mapValue!19452)) b!446081))

(assert (= (and b!446078 ((_ is ValueCellFull!5597) mapDefault!19452)) b!446077))

(assert (= start!40502 b!446078))

(declare-fun m!430893 () Bool)

(assert (=> b!446084 m!430893))

(declare-fun m!430895 () Bool)

(assert (=> b!446086 m!430895))

(declare-fun m!430897 () Bool)

(assert (=> mapNonEmpty!19452 m!430897))

(declare-fun m!430899 () Bool)

(assert (=> b!446083 m!430899))

(declare-fun m!430901 () Bool)

(assert (=> b!446080 m!430901))

(declare-fun m!430903 () Bool)

(assert (=> b!446087 m!430903))

(declare-fun m!430905 () Bool)

(assert (=> b!446087 m!430905))

(declare-fun m!430907 () Bool)

(assert (=> b!446079 m!430907))

(declare-fun m!430909 () Bool)

(assert (=> b!446082 m!430909))

(declare-fun m!430911 () Bool)

(assert (=> start!40502 m!430911))

(declare-fun m!430913 () Bool)

(assert (=> start!40502 m!430913))

(declare-fun m!430915 () Bool)

(assert (=> b!446075 m!430915))

(check-sat (not b!446087) (not b!446083) (not b!446079) (not start!40502) (not b!446086) (not b!446084) (not b!446080) (not mapNonEmpty!19452) tp_is_empty!11881 (not b!446075))
(check-sat)
