; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40456 () Bool)

(assert start!40456)

(declare-fun res!264154 () Bool)

(declare-fun e!261743 () Bool)

(assert (=> start!40456 (=> (not res!264154) (not e!261743))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27489 0))(
  ( (array!27490 (arr!13192 (Array (_ BitVec 32) (_ BitVec 64))) (size!13544 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27489)

(assert (=> start!40456 (= res!264154 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13544 _keys!709))))))

(assert (=> start!40456 e!261743))

(assert (=> start!40456 true))

(declare-datatypes ((V!16893 0))(
  ( (V!16894 (val!5965 Int)) )
))
(declare-datatypes ((ValueCell!5577 0))(
  ( (ValueCellFull!5577 (v!8216 V!16893)) (EmptyCell!5577) )
))
(declare-datatypes ((array!27491 0))(
  ( (array!27492 (arr!13193 (Array (_ BitVec 32) ValueCell!5577)) (size!13545 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27491)

(declare-fun e!261745 () Bool)

(declare-fun array_inv!9564 (array!27491) Bool)

(assert (=> start!40456 (and (array_inv!9564 _values!549) e!261745)))

(declare-fun array_inv!9565 (array!27489) Bool)

(assert (=> start!40456 (array_inv!9565 _keys!709)))

(declare-fun b!445238 () Bool)

(declare-fun e!261746 () Bool)

(assert (=> b!445238 (= e!261746 false)))

(declare-fun lt!203615 () Bool)

(declare-fun lt!203614 () array!27489)

(declare-datatypes ((List!7887 0))(
  ( (Nil!7884) (Cons!7883 (h!8739 (_ BitVec 64)) (t!13645 List!7887)) )
))
(declare-fun arrayNoDuplicates!0 (array!27489 (_ BitVec 32) List!7887) Bool)

(assert (=> b!445238 (= lt!203615 (arrayNoDuplicates!0 lt!203614 #b00000000000000000000000000000000 Nil!7884))))

(declare-fun b!445239 () Bool)

(declare-fun res!264159 () Bool)

(assert (=> b!445239 (=> (not res!264159) (not e!261743))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445239 (= res!264159 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13544 _keys!709))))))

(declare-fun b!445240 () Bool)

(declare-fun res!264160 () Bool)

(assert (=> b!445240 (=> (not res!264160) (not e!261743))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445240 (= res!264160 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445241 () Bool)

(declare-fun res!264156 () Bool)

(assert (=> b!445241 (=> (not res!264156) (not e!261743))))

(assert (=> b!445241 (= res!264156 (or (= (select (arr!13192 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13192 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445242 () Bool)

(assert (=> b!445242 (= e!261743 e!261746)))

(declare-fun res!264151 () Bool)

(assert (=> b!445242 (=> (not res!264151) (not e!261746))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27489 (_ BitVec 32)) Bool)

(assert (=> b!445242 (= res!264151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203614 mask!1025))))

(assert (=> b!445242 (= lt!203614 (array!27490 (store (arr!13192 _keys!709) i!563 k0!794) (size!13544 _keys!709)))))

(declare-fun b!445243 () Bool)

(declare-fun res!264153 () Bool)

(assert (=> b!445243 (=> (not res!264153) (not e!261743))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!445243 (= res!264153 (and (= (size!13545 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13544 _keys!709) (size!13545 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445244 () Bool)

(declare-fun res!264158 () Bool)

(assert (=> b!445244 (=> (not res!264158) (not e!261743))))

(assert (=> b!445244 (= res!264158 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7884))))

(declare-fun b!445245 () Bool)

(declare-fun res!264157 () Bool)

(assert (=> b!445245 (=> (not res!264157) (not e!261743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445245 (= res!264157 (validMask!0 mask!1025))))

(declare-fun b!445246 () Bool)

(declare-fun e!261741 () Bool)

(declare-fun tp_is_empty!11841 () Bool)

(assert (=> b!445246 (= e!261741 tp_is_empty!11841)))

(declare-fun b!445247 () Bool)

(declare-fun mapRes!19389 () Bool)

(assert (=> b!445247 (= e!261745 (and e!261741 mapRes!19389))))

(declare-fun condMapEmpty!19389 () Bool)

(declare-fun mapDefault!19389 () ValueCell!5577)

(assert (=> b!445247 (= condMapEmpty!19389 (= (arr!13193 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5577)) mapDefault!19389)))))

(declare-fun b!445248 () Bool)

(declare-fun res!264155 () Bool)

(assert (=> b!445248 (=> (not res!264155) (not e!261743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445248 (= res!264155 (validKeyInArray!0 k0!794))))

(declare-fun b!445249 () Bool)

(declare-fun e!261742 () Bool)

(assert (=> b!445249 (= e!261742 tp_is_empty!11841)))

(declare-fun b!445250 () Bool)

(declare-fun res!264152 () Bool)

(assert (=> b!445250 (=> (not res!264152) (not e!261743))))

(assert (=> b!445250 (= res!264152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19389 () Bool)

(assert (=> mapIsEmpty!19389 mapRes!19389))

(declare-fun mapNonEmpty!19389 () Bool)

(declare-fun tp!37371 () Bool)

(assert (=> mapNonEmpty!19389 (= mapRes!19389 (and tp!37371 e!261742))))

(declare-fun mapKey!19389 () (_ BitVec 32))

(declare-fun mapRest!19389 () (Array (_ BitVec 32) ValueCell!5577))

(declare-fun mapValue!19389 () ValueCell!5577)

(assert (=> mapNonEmpty!19389 (= (arr!13193 _values!549) (store mapRest!19389 mapKey!19389 mapValue!19389))))

(assert (= (and start!40456 res!264154) b!445245))

(assert (= (and b!445245 res!264157) b!445243))

(assert (= (and b!445243 res!264153) b!445250))

(assert (= (and b!445250 res!264152) b!445244))

(assert (= (and b!445244 res!264158) b!445239))

(assert (= (and b!445239 res!264159) b!445248))

(assert (= (and b!445248 res!264155) b!445241))

(assert (= (and b!445241 res!264156) b!445240))

(assert (= (and b!445240 res!264160) b!445242))

(assert (= (and b!445242 res!264151) b!445238))

(assert (= (and b!445247 condMapEmpty!19389) mapIsEmpty!19389))

(assert (= (and b!445247 (not condMapEmpty!19389)) mapNonEmpty!19389))

(get-info :version)

(assert (= (and mapNonEmpty!19389 ((_ is ValueCellFull!5577) mapValue!19389)) b!445249))

(assert (= (and b!445247 ((_ is ValueCellFull!5577) mapDefault!19389)) b!445246))

(assert (= start!40456 b!445247))

(declare-fun m!430813 () Bool)

(assert (=> b!445248 m!430813))

(declare-fun m!430815 () Bool)

(assert (=> b!445242 m!430815))

(declare-fun m!430817 () Bool)

(assert (=> b!445242 m!430817))

(declare-fun m!430819 () Bool)

(assert (=> b!445244 m!430819))

(declare-fun m!430821 () Bool)

(assert (=> b!445241 m!430821))

(declare-fun m!430823 () Bool)

(assert (=> start!40456 m!430823))

(declare-fun m!430825 () Bool)

(assert (=> start!40456 m!430825))

(declare-fun m!430827 () Bool)

(assert (=> mapNonEmpty!19389 m!430827))

(declare-fun m!430829 () Bool)

(assert (=> b!445245 m!430829))

(declare-fun m!430831 () Bool)

(assert (=> b!445240 m!430831))

(declare-fun m!430833 () Bool)

(assert (=> b!445250 m!430833))

(declare-fun m!430835 () Bool)

(assert (=> b!445238 m!430835))

(check-sat (not mapNonEmpty!19389) (not start!40456) (not b!445238) (not b!445240) (not b!445242) (not b!445248) tp_is_empty!11841 (not b!445245) (not b!445250) (not b!445244))
(check-sat)
