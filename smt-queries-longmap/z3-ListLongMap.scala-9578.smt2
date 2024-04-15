; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113330 () Bool)

(assert start!113330)

(declare-fun b_free!31381 () Bool)

(declare-fun b_next!31381 () Bool)

(assert (=> start!113330 (= b_free!31381 (not b_next!31381))))

(declare-fun tp!109949 () Bool)

(declare-fun b_and!50597 () Bool)

(assert (=> start!113330 (= tp!109949 b_and!50597)))

(declare-fun b!1344716 () Bool)

(declare-fun res!892221 () Bool)

(declare-fun e!765308 () Bool)

(assert (=> b!1344716 (=> (not res!892221) (not e!765308))))

(declare-datatypes ((array!91547 0))(
  ( (array!91548 (arr!44230 (Array (_ BitVec 32) (_ BitVec 64))) (size!44782 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91547)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344716 (= res!892221 (validKeyInArray!0 (select (arr!44230 _keys!1571) from!1960)))))

(declare-fun b!1344717 () Bool)

(declare-fun res!892226 () Bool)

(assert (=> b!1344717 (=> (not res!892226) (not e!765308))))

(declare-datatypes ((V!54945 0))(
  ( (V!54946 (val!18765 Int)) )
))
(declare-fun minValue!1245 () V!54945)

(declare-fun zeroValue!1245 () V!54945)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17792 0))(
  ( (ValueCellFull!17792 (v!21412 V!54945)) (EmptyCell!17792) )
))
(declare-datatypes ((array!91549 0))(
  ( (array!91550 (arr!44231 (Array (_ BitVec 32) ValueCell!17792)) (size!44783 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91549)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((tuple2!24246 0))(
  ( (tuple2!24247 (_1!12134 (_ BitVec 64)) (_2!12134 V!54945)) )
))
(declare-datatypes ((List!31387 0))(
  ( (Nil!31384) (Cons!31383 (h!32592 tuple2!24246) (t!45917 List!31387)) )
))
(declare-datatypes ((ListLongMap!21903 0))(
  ( (ListLongMap!21904 (toList!10967 List!31387)) )
))
(declare-fun contains!9072 (ListLongMap!21903 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5812 (array!91547 array!91549 (_ BitVec 32) (_ BitVec 32) V!54945 V!54945 (_ BitVec 32) Int) ListLongMap!21903)

(assert (=> b!1344717 (= res!892226 (contains!9072 (getCurrentListMap!5812 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344718 () Bool)

(declare-fun res!892224 () Bool)

(assert (=> b!1344718 (=> (not res!892224) (not e!765308))))

(declare-datatypes ((List!31388 0))(
  ( (Nil!31385) (Cons!31384 (h!32593 (_ BitVec 64)) (t!45918 List!31388)) )
))
(declare-fun arrayNoDuplicates!0 (array!91547 (_ BitVec 32) List!31388) Bool)

(assert (=> b!1344718 (= res!892224 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31385))))

(declare-fun b!1344720 () Bool)

(declare-fun e!765304 () Bool)

(assert (=> b!1344720 (= e!765304 (not true))))

(declare-fun lt!595030 () ListLongMap!21903)

(assert (=> b!1344720 (contains!9072 lt!595030 k0!1142)))

(declare-datatypes ((Unit!43926 0))(
  ( (Unit!43927) )
))
(declare-fun lt!595032 () Unit!43926)

(declare-fun lt!595031 () V!54945)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!381 ((_ BitVec 64) (_ BitVec 64) V!54945 ListLongMap!21903) Unit!43926)

(assert (=> b!1344720 (= lt!595032 (lemmaInListMapAfterAddingDiffThenInBefore!381 k0!1142 (select (arr!44230 _keys!1571) from!1960) lt!595031 lt!595030))))

(declare-fun b!1344721 () Bool)

(declare-fun res!892220 () Bool)

(assert (=> b!1344721 (=> (not res!892220) (not e!765308))))

(assert (=> b!1344721 (= res!892220 (not (= (select (arr!44230 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1344722 () Bool)

(declare-fun e!765303 () Bool)

(declare-fun tp_is_empty!37381 () Bool)

(assert (=> b!1344722 (= e!765303 tp_is_empty!37381)))

(declare-fun b!1344723 () Bool)

(declare-fun res!892223 () Bool)

(assert (=> b!1344723 (=> (not res!892223) (not e!765304))))

(assert (=> b!1344723 (= res!892223 (not (= k0!1142 (select (arr!44230 _keys!1571) from!1960))))))

(declare-fun mapNonEmpty!57778 () Bool)

(declare-fun mapRes!57778 () Bool)

(declare-fun tp!109948 () Bool)

(assert (=> mapNonEmpty!57778 (= mapRes!57778 (and tp!109948 e!765303))))

(declare-fun mapKey!57778 () (_ BitVec 32))

(declare-fun mapRest!57778 () (Array (_ BitVec 32) ValueCell!17792))

(declare-fun mapValue!57778 () ValueCell!17792)

(assert (=> mapNonEmpty!57778 (= (arr!44231 _values!1303) (store mapRest!57778 mapKey!57778 mapValue!57778))))

(declare-fun mapIsEmpty!57778 () Bool)

(assert (=> mapIsEmpty!57778 mapRes!57778))

(declare-fun b!1344724 () Bool)

(declare-fun res!892225 () Bool)

(assert (=> b!1344724 (=> (not res!892225) (not e!765308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91547 (_ BitVec 32)) Bool)

(assert (=> b!1344724 (= res!892225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344725 () Bool)

(declare-fun res!892219 () Bool)

(assert (=> b!1344725 (=> (not res!892219) (not e!765308))))

(assert (=> b!1344725 (= res!892219 (and (= (size!44783 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44782 _keys!1571) (size!44783 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344726 () Bool)

(declare-fun e!765306 () Bool)

(declare-fun e!765307 () Bool)

(assert (=> b!1344726 (= e!765306 (and e!765307 mapRes!57778))))

(declare-fun condMapEmpty!57778 () Bool)

(declare-fun mapDefault!57778 () ValueCell!17792)

(assert (=> b!1344726 (= condMapEmpty!57778 (= (arr!44231 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17792)) mapDefault!57778)))))

(declare-fun b!1344727 () Bool)

(assert (=> b!1344727 (= e!765308 e!765304)))

(declare-fun res!892222 () Bool)

(assert (=> b!1344727 (=> (not res!892222) (not e!765304))))

(declare-fun +!4847 (ListLongMap!21903 tuple2!24246) ListLongMap!21903)

(assert (=> b!1344727 (= res!892222 (contains!9072 (+!4847 lt!595030 (tuple2!24247 (select (arr!44230 _keys!1571) from!1960) lt!595031)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6490 (array!91547 array!91549 (_ BitVec 32) (_ BitVec 32) V!54945 V!54945 (_ BitVec 32) Int) ListLongMap!21903)

(assert (=> b!1344727 (= lt!595030 (getCurrentListMapNoExtraKeys!6490 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22347 (ValueCell!17792 V!54945) V!54945)

(declare-fun dynLambda!3777 (Int (_ BitVec 64)) V!54945)

(assert (=> b!1344727 (= lt!595031 (get!22347 (select (arr!44231 _values!1303) from!1960) (dynLambda!3777 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1344719 () Bool)

(assert (=> b!1344719 (= e!765307 tp_is_empty!37381)))

(declare-fun res!892227 () Bool)

(assert (=> start!113330 (=> (not res!892227) (not e!765308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113330 (= res!892227 (validMask!0 mask!1977))))

(assert (=> start!113330 e!765308))

(assert (=> start!113330 tp_is_empty!37381))

(assert (=> start!113330 true))

(declare-fun array_inv!33523 (array!91547) Bool)

(assert (=> start!113330 (array_inv!33523 _keys!1571)))

(declare-fun array_inv!33524 (array!91549) Bool)

(assert (=> start!113330 (and (array_inv!33524 _values!1303) e!765306)))

(assert (=> start!113330 tp!109949))

(declare-fun b!1344728 () Bool)

(declare-fun res!892228 () Bool)

(assert (=> b!1344728 (=> (not res!892228) (not e!765308))))

(assert (=> b!1344728 (= res!892228 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44782 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344729 () Bool)

(declare-fun res!892218 () Bool)

(assert (=> b!1344729 (=> (not res!892218) (not e!765308))))

(assert (=> b!1344729 (= res!892218 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!113330 res!892227) b!1344725))

(assert (= (and b!1344725 res!892219) b!1344724))

(assert (= (and b!1344724 res!892225) b!1344718))

(assert (= (and b!1344718 res!892224) b!1344728))

(assert (= (and b!1344728 res!892228) b!1344717))

(assert (= (and b!1344717 res!892226) b!1344721))

(assert (= (and b!1344721 res!892220) b!1344716))

(assert (= (and b!1344716 res!892221) b!1344729))

(assert (= (and b!1344729 res!892218) b!1344727))

(assert (= (and b!1344727 res!892222) b!1344723))

(assert (= (and b!1344723 res!892223) b!1344720))

(assert (= (and b!1344726 condMapEmpty!57778) mapIsEmpty!57778))

(assert (= (and b!1344726 (not condMapEmpty!57778)) mapNonEmpty!57778))

(get-info :version)

(assert (= (and mapNonEmpty!57778 ((_ is ValueCellFull!17792) mapValue!57778)) b!1344722))

(assert (= (and b!1344726 ((_ is ValueCellFull!17792) mapDefault!57778)) b!1344719))

(assert (= start!113330 b!1344726))

(declare-fun b_lambda!24493 () Bool)

(assert (=> (not b_lambda!24493) (not b!1344727)))

(declare-fun t!45916 () Bool)

(declare-fun tb!12333 () Bool)

(assert (=> (and start!113330 (= defaultEntry!1306 defaultEntry!1306) t!45916) tb!12333))

(declare-fun result!25765 () Bool)

(assert (=> tb!12333 (= result!25765 tp_is_empty!37381)))

(assert (=> b!1344727 t!45916))

(declare-fun b_and!50599 () Bool)

(assert (= b_and!50597 (and (=> t!45916 result!25765) b_and!50599)))

(declare-fun m!1231783 () Bool)

(assert (=> b!1344727 m!1231783))

(declare-fun m!1231785 () Bool)

(assert (=> b!1344727 m!1231785))

(declare-fun m!1231787 () Bool)

(assert (=> b!1344727 m!1231787))

(assert (=> b!1344727 m!1231783))

(assert (=> b!1344727 m!1231785))

(declare-fun m!1231789 () Bool)

(assert (=> b!1344727 m!1231789))

(declare-fun m!1231791 () Bool)

(assert (=> b!1344727 m!1231791))

(declare-fun m!1231793 () Bool)

(assert (=> b!1344727 m!1231793))

(declare-fun m!1231795 () Bool)

(assert (=> b!1344727 m!1231795))

(assert (=> b!1344727 m!1231789))

(declare-fun m!1231797 () Bool)

(assert (=> b!1344720 m!1231797))

(assert (=> b!1344720 m!1231793))

(assert (=> b!1344720 m!1231793))

(declare-fun m!1231799 () Bool)

(assert (=> b!1344720 m!1231799))

(declare-fun m!1231801 () Bool)

(assert (=> b!1344718 m!1231801))

(assert (=> b!1344716 m!1231793))

(assert (=> b!1344716 m!1231793))

(declare-fun m!1231803 () Bool)

(assert (=> b!1344716 m!1231803))

(assert (=> b!1344723 m!1231793))

(assert (=> b!1344721 m!1231793))

(declare-fun m!1231805 () Bool)

(assert (=> b!1344724 m!1231805))

(declare-fun m!1231807 () Bool)

(assert (=> start!113330 m!1231807))

(declare-fun m!1231809 () Bool)

(assert (=> start!113330 m!1231809))

(declare-fun m!1231811 () Bool)

(assert (=> start!113330 m!1231811))

(declare-fun m!1231813 () Bool)

(assert (=> mapNonEmpty!57778 m!1231813))

(declare-fun m!1231815 () Bool)

(assert (=> b!1344717 m!1231815))

(assert (=> b!1344717 m!1231815))

(declare-fun m!1231817 () Bool)

(assert (=> b!1344717 m!1231817))

(check-sat (not b_next!31381) (not start!113330) (not b!1344718) (not b!1344717) (not b!1344716) (not b_lambda!24493) b_and!50599 (not b!1344724) (not b!1344720) (not b!1344727) tp_is_empty!37381 (not mapNonEmpty!57778))
(check-sat b_and!50599 (not b_next!31381))
