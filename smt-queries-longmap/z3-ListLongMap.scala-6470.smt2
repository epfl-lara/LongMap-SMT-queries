; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82662 () Bool)

(assert start!82662)

(declare-fun b_free!18795 () Bool)

(declare-fun b_next!18795 () Bool)

(assert (=> start!82662 (= b_free!18795 (not b_next!18795))))

(declare-fun tp!65505 () Bool)

(declare-fun b_and!30283 () Bool)

(assert (=> start!82662 (= tp!65505 b_and!30283)))

(declare-fun b!963690 () Bool)

(declare-fun res!644976 () Bool)

(declare-fun e!543346 () Bool)

(assert (=> b!963690 (=> (not res!644976) (not e!543346))))

(declare-datatypes ((array!59285 0))(
  ( (array!59286 (arr!28511 (Array (_ BitVec 32) (_ BitVec 64))) (size!28990 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59285)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963690 (= res!644976 (validKeyInArray!0 (select (arr!28511 _keys!1686) i!803)))))

(declare-fun b!963691 () Bool)

(declare-fun res!644981 () Bool)

(assert (=> b!963691 (=> (not res!644981) (not e!543346))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963691 (= res!644981 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963692 () Bool)

(declare-fun res!644978 () Bool)

(assert (=> b!963692 (=> (not res!644978) (not e!543346))))

(assert (=> b!963692 (= res!644978 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28990 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28990 _keys!1686))))))

(declare-fun b!963693 () Bool)

(declare-fun res!644980 () Bool)

(assert (=> b!963693 (=> (not res!644980) (not e!543346))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59285 (_ BitVec 32)) Bool)

(assert (=> b!963693 (= res!644980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963694 () Bool)

(assert (=> b!963694 (= e!543346 (not true))))

(declare-datatypes ((V!33779 0))(
  ( (V!33780 (val!10849 Int)) )
))
(declare-datatypes ((ValueCell!10317 0))(
  ( (ValueCellFull!10317 (v!13407 V!33779)) (EmptyCell!10317) )
))
(declare-datatypes ((array!59287 0))(
  ( (array!59288 (arr!28512 (Array (_ BitVec 32) ValueCell!10317)) (size!28991 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59287)

(declare-fun minValue!1342 () V!33779)

(declare-fun defaultEntry!1403 () Int)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33779)

(declare-datatypes ((tuple2!13936 0))(
  ( (tuple2!13937 (_1!6979 (_ BitVec 64)) (_2!6979 V!33779)) )
))
(declare-datatypes ((List!19787 0))(
  ( (Nil!19784) (Cons!19783 (h!20945 tuple2!13936) (t!28150 List!19787)) )
))
(declare-datatypes ((ListLongMap!12633 0))(
  ( (ListLongMap!12634 (toList!6332 List!19787)) )
))
(declare-fun contains!5435 (ListLongMap!12633 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3565 (array!59285 array!59287 (_ BitVec 32) (_ BitVec 32) V!33779 V!33779 (_ BitVec 32) Int) ListLongMap!12633)

(assert (=> b!963694 (contains!5435 (getCurrentListMap!3565 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28511 _keys!1686) i!803))))

(declare-datatypes ((Unit!32247 0))(
  ( (Unit!32248) )
))
(declare-fun lt!430996 () Unit!32247)

(declare-fun lemmaInListMapFromThenInFromMinusOne!18 (array!59285 array!59287 (_ BitVec 32) (_ BitVec 32) V!33779 V!33779 (_ BitVec 32) (_ BitVec 32) Int) Unit!32247)

(assert (=> b!963694 (= lt!430996 (lemmaInListMapFromThenInFromMinusOne!18 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun res!644983 () Bool)

(assert (=> start!82662 (=> (not res!644983) (not e!543346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82662 (= res!644983 (validMask!0 mask!2110))))

(assert (=> start!82662 e!543346))

(assert (=> start!82662 true))

(declare-fun e!543347 () Bool)

(declare-fun array_inv!22087 (array!59287) Bool)

(assert (=> start!82662 (and (array_inv!22087 _values!1400) e!543347)))

(declare-fun array_inv!22088 (array!59285) Bool)

(assert (=> start!82662 (array_inv!22088 _keys!1686)))

(assert (=> start!82662 tp!65505))

(declare-fun tp_is_empty!21597 () Bool)

(assert (=> start!82662 tp_is_empty!21597))

(declare-fun b!963695 () Bool)

(declare-fun e!543350 () Bool)

(declare-fun mapRes!34390 () Bool)

(assert (=> b!963695 (= e!543347 (and e!543350 mapRes!34390))))

(declare-fun condMapEmpty!34390 () Bool)

(declare-fun mapDefault!34390 () ValueCell!10317)

(assert (=> b!963695 (= condMapEmpty!34390 (= (arr!28512 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10317)) mapDefault!34390)))))

(declare-fun b!963696 () Bool)

(declare-fun e!543349 () Bool)

(assert (=> b!963696 (= e!543349 tp_is_empty!21597)))

(declare-fun b!963697 () Bool)

(declare-fun res!644982 () Bool)

(assert (=> b!963697 (=> (not res!644982) (not e!543346))))

(assert (=> b!963697 (= res!644982 (contains!5435 (getCurrentListMap!3565 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28511 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34390 () Bool)

(declare-fun tp!65504 () Bool)

(assert (=> mapNonEmpty!34390 (= mapRes!34390 (and tp!65504 e!543349))))

(declare-fun mapRest!34390 () (Array (_ BitVec 32) ValueCell!10317))

(declare-fun mapKey!34390 () (_ BitVec 32))

(declare-fun mapValue!34390 () ValueCell!10317)

(assert (=> mapNonEmpty!34390 (= (arr!28512 _values!1400) (store mapRest!34390 mapKey!34390 mapValue!34390))))

(declare-fun b!963698 () Bool)

(declare-fun res!644979 () Bool)

(assert (=> b!963698 (=> (not res!644979) (not e!543346))))

(assert (=> b!963698 (= res!644979 (and (= (size!28991 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28990 _keys!1686) (size!28991 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34390 () Bool)

(assert (=> mapIsEmpty!34390 mapRes!34390))

(declare-fun b!963699 () Bool)

(assert (=> b!963699 (= e!543350 tp_is_empty!21597)))

(declare-fun b!963700 () Bool)

(declare-fun res!644977 () Bool)

(assert (=> b!963700 (=> (not res!644977) (not e!543346))))

(declare-datatypes ((List!19788 0))(
  ( (Nil!19785) (Cons!19784 (h!20946 (_ BitVec 64)) (t!28151 List!19788)) )
))
(declare-fun arrayNoDuplicates!0 (array!59285 (_ BitVec 32) List!19788) Bool)

(assert (=> b!963700 (= res!644977 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19785))))

(assert (= (and start!82662 res!644983) b!963698))

(assert (= (and b!963698 res!644979) b!963693))

(assert (= (and b!963693 res!644980) b!963700))

(assert (= (and b!963700 res!644977) b!963692))

(assert (= (and b!963692 res!644978) b!963690))

(assert (= (and b!963690 res!644976) b!963697))

(assert (= (and b!963697 res!644982) b!963691))

(assert (= (and b!963691 res!644981) b!963694))

(assert (= (and b!963695 condMapEmpty!34390) mapIsEmpty!34390))

(assert (= (and b!963695 (not condMapEmpty!34390)) mapNonEmpty!34390))

(get-info :version)

(assert (= (and mapNonEmpty!34390 ((_ is ValueCellFull!10317) mapValue!34390)) b!963696))

(assert (= (and b!963695 ((_ is ValueCellFull!10317) mapDefault!34390)) b!963699))

(assert (= start!82662 b!963695))

(declare-fun m!893057 () Bool)

(assert (=> b!963700 m!893057))

(declare-fun m!893059 () Bool)

(assert (=> b!963693 m!893059))

(declare-fun m!893061 () Bool)

(assert (=> b!963690 m!893061))

(assert (=> b!963690 m!893061))

(declare-fun m!893063 () Bool)

(assert (=> b!963690 m!893063))

(declare-fun m!893065 () Bool)

(assert (=> b!963694 m!893065))

(assert (=> b!963694 m!893061))

(assert (=> b!963694 m!893065))

(assert (=> b!963694 m!893061))

(declare-fun m!893067 () Bool)

(assert (=> b!963694 m!893067))

(declare-fun m!893069 () Bool)

(assert (=> b!963694 m!893069))

(declare-fun m!893071 () Bool)

(assert (=> start!82662 m!893071))

(declare-fun m!893073 () Bool)

(assert (=> start!82662 m!893073))

(declare-fun m!893075 () Bool)

(assert (=> start!82662 m!893075))

(declare-fun m!893077 () Bool)

(assert (=> mapNonEmpty!34390 m!893077))

(declare-fun m!893079 () Bool)

(assert (=> b!963697 m!893079))

(assert (=> b!963697 m!893061))

(assert (=> b!963697 m!893079))

(assert (=> b!963697 m!893061))

(declare-fun m!893081 () Bool)

(assert (=> b!963697 m!893081))

(check-sat (not b!963690) (not start!82662) b_and!30283 (not b!963700) (not b_next!18795) tp_is_empty!21597 (not b!963693) (not b!963694) (not b!963697) (not mapNonEmpty!34390))
(check-sat b_and!30283 (not b_next!18795))
