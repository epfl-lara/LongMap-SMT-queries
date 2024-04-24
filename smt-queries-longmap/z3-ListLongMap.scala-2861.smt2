; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41208 () Bool)

(assert start!41208)

(declare-fun b_free!11065 () Bool)

(declare-fun b_next!11065 () Bool)

(assert (=> start!41208 (= b_free!11065 (not b_next!11065))))

(declare-fun tp!39034 () Bool)

(declare-fun b_and!19395 () Bool)

(assert (=> start!41208 (= tp!39034 b_and!19395)))

(declare-fun b!460887 () Bool)

(declare-fun res!275614 () Bool)

(declare-fun e!268858 () Bool)

(assert (=> b!460887 (=> (not res!275614) (not e!268858))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460887 (= res!275614 (validMask!0 mask!1025))))

(declare-fun b!460888 () Bool)

(declare-fun e!268853 () Bool)

(assert (=> b!460888 (= e!268858 e!268853)))

(declare-fun res!275619 () Bool)

(assert (=> b!460888 (=> (not res!275619) (not e!268853))))

(declare-datatypes ((array!28602 0))(
  ( (array!28603 (arr!13740 (Array (_ BitVec 32) (_ BitVec 64))) (size!14092 (_ BitVec 32))) )
))
(declare-fun lt!208852 () array!28602)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28602 (_ BitVec 32)) Bool)

(assert (=> b!460888 (= res!275619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208852 mask!1025))))

(declare-fun _keys!709 () array!28602)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!460888 (= lt!208852 (array!28603 (store (arr!13740 _keys!709) i!563 k0!794) (size!14092 _keys!709)))))

(declare-fun b!460889 () Bool)

(declare-fun res!275613 () Bool)

(assert (=> b!460889 (=> (not res!275613) (not e!268858))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17643 0))(
  ( (V!17644 (val!6246 Int)) )
))
(declare-datatypes ((ValueCell!5858 0))(
  ( (ValueCellFull!5858 (v!8529 V!17643)) (EmptyCell!5858) )
))
(declare-datatypes ((array!28604 0))(
  ( (array!28605 (arr!13741 (Array (_ BitVec 32) ValueCell!5858)) (size!14093 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28604)

(assert (=> b!460889 (= res!275613 (and (= (size!14093 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14092 _keys!709) (size!14093 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460890 () Bool)

(declare-fun res!275617 () Bool)

(assert (=> b!460890 (=> (not res!275617) (not e!268858))))

(declare-fun arrayContainsKey!0 (array!28602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460890 (= res!275617 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!460891 () Bool)

(declare-fun res!275618 () Bool)

(assert (=> b!460891 (=> (not res!275618) (not e!268858))))

(declare-datatypes ((List!8234 0))(
  ( (Nil!8231) (Cons!8230 (h!9086 (_ BitVec 64)) (t!14168 List!8234)) )
))
(declare-fun arrayNoDuplicates!0 (array!28602 (_ BitVec 32) List!8234) Bool)

(assert (=> b!460891 (= res!275618 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8231))))

(declare-fun b!460892 () Bool)

(declare-fun e!268859 () Bool)

(assert (=> b!460892 (= e!268859 (not true))))

(declare-fun minValue!515 () V!17643)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17643)

(declare-fun lt!208850 () array!28604)

(declare-fun v!412 () V!17643)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!8170 0))(
  ( (tuple2!8171 (_1!4096 (_ BitVec 64)) (_2!4096 V!17643)) )
))
(declare-datatypes ((List!8235 0))(
  ( (Nil!8232) (Cons!8231 (h!9087 tuple2!8170) (t!14169 List!8235)) )
))
(declare-datatypes ((ListLongMap!7085 0))(
  ( (ListLongMap!7086 (toList!3558 List!8235)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1785 (array!28602 array!28604 (_ BitVec 32) (_ BitVec 32) V!17643 V!17643 (_ BitVec 32) Int) ListLongMap!7085)

(declare-fun +!1633 (ListLongMap!7085 tuple2!8170) ListLongMap!7085)

(assert (=> b!460892 (= (getCurrentListMapNoExtraKeys!1785 lt!208852 lt!208850 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1633 (getCurrentListMapNoExtraKeys!1785 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8171 k0!794 v!412)))))

(declare-datatypes ((Unit!13410 0))(
  ( (Unit!13411) )
))
(declare-fun lt!208853 () Unit!13410)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!787 (array!28602 array!28604 (_ BitVec 32) (_ BitVec 32) V!17643 V!17643 (_ BitVec 32) (_ BitVec 64) V!17643 (_ BitVec 32) Int) Unit!13410)

(assert (=> b!460892 (= lt!208853 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!787 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460893 () Bool)

(declare-fun res!275608 () Bool)

(assert (=> b!460893 (=> (not res!275608) (not e!268858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460893 (= res!275608 (validKeyInArray!0 k0!794))))

(declare-fun b!460894 () Bool)

(declare-fun res!275611 () Bool)

(assert (=> b!460894 (=> (not res!275611) (not e!268858))))

(assert (=> b!460894 (= res!275611 (or (= (select (arr!13740 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13740 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460895 () Bool)

(declare-fun res!275612 () Bool)

(assert (=> b!460895 (=> (not res!275612) (not e!268858))))

(assert (=> b!460895 (= res!275612 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14092 _keys!709))))))

(declare-fun b!460896 () Bool)

(declare-fun res!275620 () Bool)

(assert (=> b!460896 (=> (not res!275620) (not e!268858))))

(assert (=> b!460896 (= res!275620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!20257 () Bool)

(declare-fun mapRes!20257 () Bool)

(declare-fun tp!39033 () Bool)

(declare-fun e!268857 () Bool)

(assert (=> mapNonEmpty!20257 (= mapRes!20257 (and tp!39033 e!268857))))

(declare-fun mapKey!20257 () (_ BitVec 32))

(declare-fun mapValue!20257 () ValueCell!5858)

(declare-fun mapRest!20257 () (Array (_ BitVec 32) ValueCell!5858))

(assert (=> mapNonEmpty!20257 (= (arr!13741 _values!549) (store mapRest!20257 mapKey!20257 mapValue!20257))))

(declare-fun b!460897 () Bool)

(declare-fun res!275610 () Bool)

(assert (=> b!460897 (=> (not res!275610) (not e!268853))))

(assert (=> b!460897 (= res!275610 (arrayNoDuplicates!0 lt!208852 #b00000000000000000000000000000000 Nil!8231))))

(declare-fun b!460898 () Bool)

(declare-fun res!275609 () Bool)

(assert (=> b!460898 (=> (not res!275609) (not e!268853))))

(assert (=> b!460898 (= res!275609 (bvsle from!863 i!563))))

(declare-fun b!460899 () Bool)

(declare-fun tp_is_empty!12403 () Bool)

(assert (=> b!460899 (= e!268857 tp_is_empty!12403)))

(declare-fun b!460900 () Bool)

(declare-fun e!268854 () Bool)

(assert (=> b!460900 (= e!268854 tp_is_empty!12403)))

(declare-fun res!275616 () Bool)

(assert (=> start!41208 (=> (not res!275616) (not e!268858))))

(assert (=> start!41208 (= res!275616 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14092 _keys!709))))))

(assert (=> start!41208 e!268858))

(assert (=> start!41208 tp_is_empty!12403))

(assert (=> start!41208 tp!39034))

(assert (=> start!41208 true))

(declare-fun e!268856 () Bool)

(declare-fun array_inv!10020 (array!28604) Bool)

(assert (=> start!41208 (and (array_inv!10020 _values!549) e!268856)))

(declare-fun array_inv!10021 (array!28602) Bool)

(assert (=> start!41208 (array_inv!10021 _keys!709)))

(declare-fun mapIsEmpty!20257 () Bool)

(assert (=> mapIsEmpty!20257 mapRes!20257))

(declare-fun b!460901 () Bool)

(assert (=> b!460901 (= e!268853 e!268859)))

(declare-fun res!275615 () Bool)

(assert (=> b!460901 (=> (not res!275615) (not e!268859))))

(assert (=> b!460901 (= res!275615 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!208851 () ListLongMap!7085)

(assert (=> b!460901 (= lt!208851 (getCurrentListMapNoExtraKeys!1785 lt!208852 lt!208850 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!460901 (= lt!208850 (array!28605 (store (arr!13741 _values!549) i!563 (ValueCellFull!5858 v!412)) (size!14093 _values!549)))))

(declare-fun lt!208854 () ListLongMap!7085)

(assert (=> b!460901 (= lt!208854 (getCurrentListMapNoExtraKeys!1785 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460902 () Bool)

(assert (=> b!460902 (= e!268856 (and e!268854 mapRes!20257))))

(declare-fun condMapEmpty!20257 () Bool)

(declare-fun mapDefault!20257 () ValueCell!5858)

(assert (=> b!460902 (= condMapEmpty!20257 (= (arr!13741 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5858)) mapDefault!20257)))))

(assert (= (and start!41208 res!275616) b!460887))

(assert (= (and b!460887 res!275614) b!460889))

(assert (= (and b!460889 res!275613) b!460896))

(assert (= (and b!460896 res!275620) b!460891))

(assert (= (and b!460891 res!275618) b!460895))

(assert (= (and b!460895 res!275612) b!460893))

(assert (= (and b!460893 res!275608) b!460894))

(assert (= (and b!460894 res!275611) b!460890))

(assert (= (and b!460890 res!275617) b!460888))

(assert (= (and b!460888 res!275619) b!460897))

(assert (= (and b!460897 res!275610) b!460898))

(assert (= (and b!460898 res!275609) b!460901))

(assert (= (and b!460901 res!275615) b!460892))

(assert (= (and b!460902 condMapEmpty!20257) mapIsEmpty!20257))

(assert (= (and b!460902 (not condMapEmpty!20257)) mapNonEmpty!20257))

(get-info :version)

(assert (= (and mapNonEmpty!20257 ((_ is ValueCellFull!5858) mapValue!20257)) b!460899))

(assert (= (and b!460902 ((_ is ValueCellFull!5858) mapDefault!20257)) b!460900))

(assert (= start!41208 b!460902))

(declare-fun m!444383 () Bool)

(assert (=> b!460894 m!444383))

(declare-fun m!444385 () Bool)

(assert (=> b!460890 m!444385))

(declare-fun m!444387 () Bool)

(assert (=> b!460888 m!444387))

(declare-fun m!444389 () Bool)

(assert (=> b!460888 m!444389))

(declare-fun m!444391 () Bool)

(assert (=> b!460893 m!444391))

(declare-fun m!444393 () Bool)

(assert (=> b!460891 m!444393))

(declare-fun m!444395 () Bool)

(assert (=> mapNonEmpty!20257 m!444395))

(declare-fun m!444397 () Bool)

(assert (=> b!460901 m!444397))

(declare-fun m!444399 () Bool)

(assert (=> b!460901 m!444399))

(declare-fun m!444401 () Bool)

(assert (=> b!460901 m!444401))

(declare-fun m!444403 () Bool)

(assert (=> start!41208 m!444403))

(declare-fun m!444405 () Bool)

(assert (=> start!41208 m!444405))

(declare-fun m!444407 () Bool)

(assert (=> b!460887 m!444407))

(declare-fun m!444409 () Bool)

(assert (=> b!460896 m!444409))

(declare-fun m!444411 () Bool)

(assert (=> b!460892 m!444411))

(declare-fun m!444413 () Bool)

(assert (=> b!460892 m!444413))

(assert (=> b!460892 m!444413))

(declare-fun m!444415 () Bool)

(assert (=> b!460892 m!444415))

(declare-fun m!444417 () Bool)

(assert (=> b!460892 m!444417))

(declare-fun m!444419 () Bool)

(assert (=> b!460897 m!444419))

(check-sat (not b!460891) (not b!460887) (not b!460888) (not b!460896) (not b!460901) tp_is_empty!12403 (not b!460892) (not b_next!11065) (not b!460893) (not b!460897) b_and!19395 (not start!41208) (not mapNonEmpty!20257) (not b!460890))
(check-sat b_and!19395 (not b_next!11065))
