; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82286 () Bool)

(assert start!82286)

(declare-fun b_free!18577 () Bool)

(declare-fun b_next!18577 () Bool)

(assert (=> start!82286 (= b_free!18577 (not b_next!18577))))

(declare-fun tp!64692 () Bool)

(declare-fun b_and!30039 () Bool)

(assert (=> start!82286 (= tp!64692 b_and!30039)))

(declare-fun b!959303 () Bool)

(declare-fun e!540748 () Bool)

(declare-fun tp_is_empty!21283 () Bool)

(assert (=> b!959303 (= e!540748 tp_is_empty!21283)))

(declare-fun b!959304 () Bool)

(declare-fun res!642199 () Bool)

(declare-fun e!540750 () Bool)

(assert (=> b!959304 (=> (not res!642199) (not e!540750))))

(declare-datatypes ((array!58594 0))(
  ( (array!58595 (arr!28171 (Array (_ BitVec 32) (_ BitVec 64))) (size!28652 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58594)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58594 (_ BitVec 32)) Bool)

(assert (=> b!959304 (= res!642199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959305 () Bool)

(declare-fun res!642197 () Bool)

(assert (=> b!959305 (=> (not res!642197) (not e!540750))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959305 (= res!642197 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28652 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28652 _keys!1668))))))

(declare-fun b!959306 () Bool)

(declare-fun res!642200 () Bool)

(assert (=> b!959306 (=> (not res!642200) (not e!540750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959306 (= res!642200 (validKeyInArray!0 (select (arr!28171 _keys!1668) i!793)))))

(declare-fun b!959307 () Bool)

(declare-fun res!642201 () Bool)

(assert (=> b!959307 (=> (not res!642201) (not e!540750))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33361 0))(
  ( (V!33362 (val!10692 Int)) )
))
(declare-datatypes ((ValueCell!10160 0))(
  ( (ValueCellFull!10160 (v!13248 V!33361)) (EmptyCell!10160) )
))
(declare-datatypes ((array!58596 0))(
  ( (array!58597 (arr!28172 (Array (_ BitVec 32) ValueCell!10160)) (size!28653 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58596)

(assert (=> b!959307 (= res!642201 (and (= (size!28653 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28652 _keys!1668) (size!28653 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959308 () Bool)

(declare-fun e!540749 () Bool)

(assert (=> b!959308 (= e!540749 tp_is_empty!21283)))

(declare-fun b!959309 () Bool)

(declare-fun res!642198 () Bool)

(assert (=> b!959309 (=> (not res!642198) (not e!540750))))

(declare-fun minValue!1328 () V!33361)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33361)

(declare-datatypes ((tuple2!13838 0))(
  ( (tuple2!13839 (_1!6930 (_ BitVec 64)) (_2!6930 V!33361)) )
))
(declare-datatypes ((List!19620 0))(
  ( (Nil!19617) (Cons!19616 (h!20778 tuple2!13838) (t!27974 List!19620)) )
))
(declare-datatypes ((ListLongMap!12525 0))(
  ( (ListLongMap!12526 (toList!6278 List!19620)) )
))
(declare-fun contains!5324 (ListLongMap!12525 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3440 (array!58594 array!58596 (_ BitVec 32) (_ BitVec 32) V!33361 V!33361 (_ BitVec 32) Int) ListLongMap!12525)

(assert (=> b!959309 (= res!642198 (contains!5324 (getCurrentListMap!3440 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28171 _keys!1668) i!793)))))

(declare-fun b!959311 () Bool)

(declare-fun e!540752 () Bool)

(declare-fun mapRes!33904 () Bool)

(assert (=> b!959311 (= e!540752 (and e!540748 mapRes!33904))))

(declare-fun condMapEmpty!33904 () Bool)

(declare-fun mapDefault!33904 () ValueCell!10160)

(assert (=> b!959311 (= condMapEmpty!33904 (= (arr!28172 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10160)) mapDefault!33904)))))

(declare-fun mapNonEmpty!33904 () Bool)

(declare-fun tp!64693 () Bool)

(assert (=> mapNonEmpty!33904 (= mapRes!33904 (and tp!64693 e!540749))))

(declare-fun mapValue!33904 () ValueCell!10160)

(declare-fun mapKey!33904 () (_ BitVec 32))

(declare-fun mapRest!33904 () (Array (_ BitVec 32) ValueCell!10160))

(assert (=> mapNonEmpty!33904 (= (arr!28172 _values!1386) (store mapRest!33904 mapKey!33904 mapValue!33904))))

(declare-fun mapIsEmpty!33904 () Bool)

(assert (=> mapIsEmpty!33904 mapRes!33904))

(declare-fun b!959312 () Bool)

(assert (=> b!959312 (= e!540750 (not (bvsle #b00000000000000000000000000000000 (size!28652 _keys!1668))))))

(assert (=> b!959312 (contains!5324 (getCurrentListMap!3440 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28171 _keys!1668) i!793))))

(declare-datatypes ((Unit!32052 0))(
  ( (Unit!32053) )
))
(declare-fun lt!430321 () Unit!32052)

(declare-fun lemmaInListMapFromThenInFromSmaller!17 (array!58594 array!58596 (_ BitVec 32) (_ BitVec 32) V!33361 V!33361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32052)

(assert (=> b!959312 (= lt!430321 (lemmaInListMapFromThenInFromSmaller!17 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959310 () Bool)

(declare-fun res!642195 () Bool)

(assert (=> b!959310 (=> (not res!642195) (not e!540750))))

(declare-datatypes ((List!19621 0))(
  ( (Nil!19618) (Cons!19617 (h!20779 (_ BitVec 64)) (t!27975 List!19621)) )
))
(declare-fun arrayNoDuplicates!0 (array!58594 (_ BitVec 32) List!19621) Bool)

(assert (=> b!959310 (= res!642195 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19618))))

(declare-fun res!642196 () Bool)

(assert (=> start!82286 (=> (not res!642196) (not e!540750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82286 (= res!642196 (validMask!0 mask!2088))))

(assert (=> start!82286 e!540750))

(assert (=> start!82286 true))

(assert (=> start!82286 tp_is_empty!21283))

(declare-fun array_inv!21895 (array!58594) Bool)

(assert (=> start!82286 (array_inv!21895 _keys!1668)))

(declare-fun array_inv!21896 (array!58596) Bool)

(assert (=> start!82286 (and (array_inv!21896 _values!1386) e!540752)))

(assert (=> start!82286 tp!64692))

(assert (= (and start!82286 res!642196) b!959307))

(assert (= (and b!959307 res!642201) b!959304))

(assert (= (and b!959304 res!642199) b!959310))

(assert (= (and b!959310 res!642195) b!959305))

(assert (= (and b!959305 res!642197) b!959306))

(assert (= (and b!959306 res!642200) b!959309))

(assert (= (and b!959309 res!642198) b!959312))

(assert (= (and b!959311 condMapEmpty!33904) mapIsEmpty!33904))

(assert (= (and b!959311 (not condMapEmpty!33904)) mapNonEmpty!33904))

(get-info :version)

(assert (= (and mapNonEmpty!33904 ((_ is ValueCellFull!10160) mapValue!33904)) b!959308))

(assert (= (and b!959311 ((_ is ValueCellFull!10160) mapDefault!33904)) b!959303))

(assert (= start!82286 b!959311))

(declare-fun m!889263 () Bool)

(assert (=> b!959304 m!889263))

(declare-fun m!889265 () Bool)

(assert (=> b!959310 m!889265))

(declare-fun m!889267 () Bool)

(assert (=> b!959309 m!889267))

(declare-fun m!889269 () Bool)

(assert (=> b!959309 m!889269))

(assert (=> b!959309 m!889267))

(assert (=> b!959309 m!889269))

(declare-fun m!889271 () Bool)

(assert (=> b!959309 m!889271))

(declare-fun m!889273 () Bool)

(assert (=> b!959312 m!889273))

(assert (=> b!959312 m!889269))

(assert (=> b!959312 m!889273))

(assert (=> b!959312 m!889269))

(declare-fun m!889275 () Bool)

(assert (=> b!959312 m!889275))

(declare-fun m!889277 () Bool)

(assert (=> b!959312 m!889277))

(declare-fun m!889279 () Bool)

(assert (=> start!82286 m!889279))

(declare-fun m!889281 () Bool)

(assert (=> start!82286 m!889281))

(declare-fun m!889283 () Bool)

(assert (=> start!82286 m!889283))

(declare-fun m!889285 () Bool)

(assert (=> mapNonEmpty!33904 m!889285))

(assert (=> b!959306 m!889269))

(assert (=> b!959306 m!889269))

(declare-fun m!889287 () Bool)

(assert (=> b!959306 m!889287))

(check-sat (not b!959306) (not b!959312) (not b_next!18577) (not mapNonEmpty!33904) b_and!30039 (not b!959304) tp_is_empty!21283 (not b!959310) (not b!959309) (not start!82286))
(check-sat b_and!30039 (not b_next!18577))
