; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82654 () Bool)

(assert start!82654)

(declare-fun b_free!18805 () Bool)

(declare-fun b_next!18805 () Bool)

(assert (=> start!82654 (= b_free!18805 (not b_next!18805))))

(declare-fun tp!65536 () Bool)

(declare-fun b_and!30267 () Bool)

(assert (=> start!82654 (= tp!65536 b_and!30267)))

(declare-fun res!644986 () Bool)

(declare-fun e!543275 () Bool)

(assert (=> start!82654 (=> (not res!644986) (not e!543275))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82654 (= res!644986 (validMask!0 mask!2110))))

(assert (=> start!82654 e!543275))

(assert (=> start!82654 true))

(declare-datatypes ((V!33793 0))(
  ( (V!33794 (val!10854 Int)) )
))
(declare-datatypes ((ValueCell!10322 0))(
  ( (ValueCellFull!10322 (v!13411 V!33793)) (EmptyCell!10322) )
))
(declare-datatypes ((array!59240 0))(
  ( (array!59241 (arr!28489 (Array (_ BitVec 32) ValueCell!10322)) (size!28970 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59240)

(declare-fun e!543273 () Bool)

(declare-fun array_inv!22131 (array!59240) Bool)

(assert (=> start!82654 (and (array_inv!22131 _values!1400) e!543273)))

(declare-datatypes ((array!59242 0))(
  ( (array!59243 (arr!28490 (Array (_ BitVec 32) (_ BitVec 64))) (size!28971 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59242)

(declare-fun array_inv!22132 (array!59242) Bool)

(assert (=> start!82654 (array_inv!22132 _keys!1686)))

(assert (=> start!82654 tp!65536))

(declare-fun tp_is_empty!21607 () Bool)

(assert (=> start!82654 tp_is_empty!21607))

(declare-fun b!963616 () Bool)

(declare-fun res!644988 () Bool)

(assert (=> b!963616 (=> (not res!644988) (not e!543275))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963616 (= res!644988 (validKeyInArray!0 (select (arr!28490 _keys!1686) i!803)))))

(declare-fun b!963617 () Bool)

(declare-fun res!644991 () Bool)

(assert (=> b!963617 (=> (not res!644991) (not e!543275))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33793)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33793)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14014 0))(
  ( (tuple2!14015 (_1!7018 (_ BitVec 64)) (_2!7018 V!33793)) )
))
(declare-datatypes ((List!19822 0))(
  ( (Nil!19819) (Cons!19818 (h!20980 tuple2!14014) (t!28176 List!19822)) )
))
(declare-datatypes ((ListLongMap!12701 0))(
  ( (ListLongMap!12702 (toList!6366 List!19822)) )
))
(declare-fun contains!5413 (ListLongMap!12701 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3528 (array!59242 array!59240 (_ BitVec 32) (_ BitVec 32) V!33793 V!33793 (_ BitVec 32) Int) ListLongMap!12701)

(assert (=> b!963617 (= res!644991 (contains!5413 (getCurrentListMap!3528 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28490 _keys!1686) i!803)))))

(declare-fun b!963618 () Bool)

(assert (=> b!963618 (= e!543275 (not true))))

(assert (=> b!963618 (contains!5413 (getCurrentListMap!3528 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28490 _keys!1686) i!803))))

(declare-datatypes ((Unit!32118 0))(
  ( (Unit!32119) )
))
(declare-fun lt!430775 () Unit!32118)

(declare-fun lemmaInListMapFromThenInFromMinusOne!25 (array!59242 array!59240 (_ BitVec 32) (_ BitVec 32) V!33793 V!33793 (_ BitVec 32) (_ BitVec 32) Int) Unit!32118)

(assert (=> b!963618 (= lt!430775 (lemmaInListMapFromThenInFromMinusOne!25 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapNonEmpty!34405 () Bool)

(declare-fun mapRes!34405 () Bool)

(declare-fun tp!65535 () Bool)

(declare-fun e!543276 () Bool)

(assert (=> mapNonEmpty!34405 (= mapRes!34405 (and tp!65535 e!543276))))

(declare-fun mapValue!34405 () ValueCell!10322)

(declare-fun mapRest!34405 () (Array (_ BitVec 32) ValueCell!10322))

(declare-fun mapKey!34405 () (_ BitVec 32))

(assert (=> mapNonEmpty!34405 (= (arr!28489 _values!1400) (store mapRest!34405 mapKey!34405 mapValue!34405))))

(declare-fun b!963619 () Bool)

(declare-fun res!644989 () Bool)

(assert (=> b!963619 (=> (not res!644989) (not e!543275))))

(assert (=> b!963619 (= res!644989 (and (= (size!28970 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28971 _keys!1686) (size!28970 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963620 () Bool)

(assert (=> b!963620 (= e!543276 tp_is_empty!21607)))

(declare-fun b!963621 () Bool)

(declare-fun res!644990 () Bool)

(assert (=> b!963621 (=> (not res!644990) (not e!543275))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963621 (= res!644990 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28971 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28971 _keys!1686))))))

(declare-fun b!963622 () Bool)

(declare-fun res!644992 () Bool)

(assert (=> b!963622 (=> (not res!644992) (not e!543275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59242 (_ BitVec 32)) Bool)

(assert (=> b!963622 (= res!644992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963623 () Bool)

(declare-fun e!543277 () Bool)

(assert (=> b!963623 (= e!543277 tp_is_empty!21607)))

(declare-fun b!963624 () Bool)

(declare-fun res!644993 () Bool)

(assert (=> b!963624 (=> (not res!644993) (not e!543275))))

(assert (=> b!963624 (= res!644993 (bvsgt from!2084 newFrom!159))))

(declare-fun mapIsEmpty!34405 () Bool)

(assert (=> mapIsEmpty!34405 mapRes!34405))

(declare-fun b!963625 () Bool)

(assert (=> b!963625 (= e!543273 (and e!543277 mapRes!34405))))

(declare-fun condMapEmpty!34405 () Bool)

(declare-fun mapDefault!34405 () ValueCell!10322)

(assert (=> b!963625 (= condMapEmpty!34405 (= (arr!28489 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10322)) mapDefault!34405)))))

(declare-fun b!963626 () Bool)

(declare-fun res!644987 () Bool)

(assert (=> b!963626 (=> (not res!644987) (not e!543275))))

(declare-datatypes ((List!19823 0))(
  ( (Nil!19820) (Cons!19819 (h!20981 (_ BitVec 64)) (t!28177 List!19823)) )
))
(declare-fun arrayNoDuplicates!0 (array!59242 (_ BitVec 32) List!19823) Bool)

(assert (=> b!963626 (= res!644987 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19820))))

(assert (= (and start!82654 res!644986) b!963619))

(assert (= (and b!963619 res!644989) b!963622))

(assert (= (and b!963622 res!644992) b!963626))

(assert (= (and b!963626 res!644987) b!963621))

(assert (= (and b!963621 res!644990) b!963616))

(assert (= (and b!963616 res!644988) b!963617))

(assert (= (and b!963617 res!644991) b!963624))

(assert (= (and b!963624 res!644993) b!963618))

(assert (= (and b!963625 condMapEmpty!34405) mapIsEmpty!34405))

(assert (= (and b!963625 (not condMapEmpty!34405)) mapNonEmpty!34405))

(get-info :version)

(assert (= (and mapNonEmpty!34405 ((_ is ValueCellFull!10322) mapValue!34405)) b!963620))

(assert (= (and b!963625 ((_ is ValueCellFull!10322) mapDefault!34405)) b!963623))

(assert (= start!82654 b!963625))

(declare-fun m!892429 () Bool)

(assert (=> b!963626 m!892429))

(declare-fun m!892431 () Bool)

(assert (=> b!963617 m!892431))

(declare-fun m!892433 () Bool)

(assert (=> b!963617 m!892433))

(assert (=> b!963617 m!892431))

(assert (=> b!963617 m!892433))

(declare-fun m!892435 () Bool)

(assert (=> b!963617 m!892435))

(declare-fun m!892437 () Bool)

(assert (=> start!82654 m!892437))

(declare-fun m!892439 () Bool)

(assert (=> start!82654 m!892439))

(declare-fun m!892441 () Bool)

(assert (=> start!82654 m!892441))

(declare-fun m!892443 () Bool)

(assert (=> b!963618 m!892443))

(assert (=> b!963618 m!892433))

(assert (=> b!963618 m!892443))

(assert (=> b!963618 m!892433))

(declare-fun m!892445 () Bool)

(assert (=> b!963618 m!892445))

(declare-fun m!892447 () Bool)

(assert (=> b!963618 m!892447))

(declare-fun m!892449 () Bool)

(assert (=> mapNonEmpty!34405 m!892449))

(declare-fun m!892451 () Bool)

(assert (=> b!963622 m!892451))

(assert (=> b!963616 m!892433))

(assert (=> b!963616 m!892433))

(declare-fun m!892453 () Bool)

(assert (=> b!963616 m!892453))

(check-sat (not b!963616) b_and!30267 (not b_next!18805) tp_is_empty!21607 (not b!963618) (not b!963626) (not b!963622) (not start!82654) (not b!963617) (not mapNonEmpty!34405))
(check-sat b_and!30267 (not b_next!18805))
