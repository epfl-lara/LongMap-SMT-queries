; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4576 () Bool)

(assert start!4576)

(declare-fun b_free!1275 () Bool)

(declare-fun b_next!1275 () Bool)

(assert (=> start!4576 (= b_free!1275 (not b_next!1275))))

(declare-fun tp!5272 () Bool)

(declare-fun b_and!2103 () Bool)

(assert (=> start!4576 (= tp!5272 b_and!2103)))

(declare-fun b!35769 () Bool)

(declare-fun e!22599 () Bool)

(declare-fun e!22600 () Bool)

(declare-fun mapRes!1999 () Bool)

(assert (=> b!35769 (= e!22599 (and e!22600 mapRes!1999))))

(declare-fun condMapEmpty!1999 () Bool)

(declare-datatypes ((V!1997 0))(
  ( (V!1998 (val!841 Int)) )
))
(declare-datatypes ((ValueCell!615 0))(
  ( (ValueCellFull!615 (v!1939 V!1997)) (EmptyCell!615) )
))
(declare-datatypes ((array!2473 0))(
  ( (array!2474 (arr!1181 (Array (_ BitVec 32) ValueCell!615)) (size!1282 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2473)

(declare-fun mapDefault!1999 () ValueCell!615)

(assert (=> b!35769 (= condMapEmpty!1999 (= (arr!1181 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!615)) mapDefault!1999)))))

(declare-fun mapNonEmpty!1999 () Bool)

(declare-fun tp!5271 () Bool)

(declare-fun e!22603 () Bool)

(assert (=> mapNonEmpty!1999 (= mapRes!1999 (and tp!5271 e!22603))))

(declare-fun mapValue!1999 () ValueCell!615)

(declare-fun mapKey!1999 () (_ BitVec 32))

(declare-fun mapRest!1999 () (Array (_ BitVec 32) ValueCell!615))

(assert (=> mapNonEmpty!1999 (= (arr!1181 _values!1501) (store mapRest!1999 mapKey!1999 mapValue!1999))))

(declare-fun b!35770 () Bool)

(declare-fun e!22604 () Bool)

(declare-fun e!22602 () Bool)

(assert (=> b!35770 (= e!22604 e!22602)))

(declare-fun res!21703 () Bool)

(assert (=> b!35770 (=> (not res!21703) (not e!22602))))

(declare-datatypes ((SeekEntryResult!164 0))(
  ( (MissingZero!164 (index!2778 (_ BitVec 32))) (Found!164 (index!2779 (_ BitVec 32))) (Intermediate!164 (undefined!976 Bool) (index!2780 (_ BitVec 32)) (x!7044 (_ BitVec 32))) (Undefined!164) (MissingVacant!164 (index!2781 (_ BitVec 32))) )
))
(declare-fun lt!13203 () SeekEntryResult!164)

(get-info :version)

(assert (=> b!35770 (= res!21703 ((_ is Found!164) lt!13203))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((array!2475 0))(
  ( (array!2476 (arr!1182 (Array (_ BitVec 32) (_ BitVec 64))) (size!1283 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2475)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2475 (_ BitVec 32)) SeekEntryResult!164)

(assert (=> b!35770 (= lt!13203 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!35772 () Bool)

(declare-fun tp_is_empty!1629 () Bool)

(assert (=> b!35772 (= e!22600 tp_is_empty!1629)))

(declare-fun b!35773 () Bool)

(declare-fun res!21699 () Bool)

(declare-fun e!22605 () Bool)

(assert (=> b!35773 (=> (not res!21699) (not e!22605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2475 (_ BitVec 32)) Bool)

(assert (=> b!35773 (= res!21699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1999 () Bool)

(assert (=> mapIsEmpty!1999 mapRes!1999))

(declare-fun b!35774 () Bool)

(assert (=> b!35774 (= e!22602 (not true))))

(declare-datatypes ((tuple2!1352 0))(
  ( (tuple2!1353 (_1!687 (_ BitVec 64)) (_2!687 V!1997)) )
))
(declare-datatypes ((List!945 0))(
  ( (Nil!942) (Cons!941 (h!1508 tuple2!1352) (t!3656 List!945)) )
))
(declare-datatypes ((ListLongMap!929 0))(
  ( (ListLongMap!930 (toList!480 List!945)) )
))
(declare-fun lt!13204 () ListLongMap!929)

(declare-fun contains!429 (ListLongMap!929 (_ BitVec 64)) Bool)

(assert (=> b!35774 (contains!429 lt!13204 (select (arr!1182 _keys!1833) (index!2779 lt!13203)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!790 0))(
  ( (Unit!791) )
))
(declare-fun lt!13202 () Unit!790)

(declare-fun zeroValue!1443 () V!1997)

(declare-fun minValue!1443 () V!1997)

(declare-fun lemmaValidKeyInArrayIsInListMap!73 (array!2475 array!2473 (_ BitVec 32) (_ BitVec 32) V!1997 V!1997 (_ BitVec 32) Int) Unit!790)

(assert (=> b!35774 (= lt!13202 (lemmaValidKeyInArrayIsInListMap!73 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2779 lt!13203) defaultEntry!1504))))

(declare-fun b!35775 () Bool)

(declare-fun res!21701 () Bool)

(assert (=> b!35775 (=> (not res!21701) (not e!22605))))

(assert (=> b!35775 (= res!21701 (and (= (size!1282 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1283 _keys!1833) (size!1282 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!35776 () Bool)

(assert (=> b!35776 (= e!22603 tp_is_empty!1629)))

(declare-fun b!35777 () Bool)

(declare-fun res!21706 () Bool)

(assert (=> b!35777 (=> (not res!21706) (not e!22604))))

(declare-fun arrayContainsKey!0 (array!2475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!35777 (= res!21706 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun res!21700 () Bool)

(assert (=> start!4576 (=> (not res!21700) (not e!22605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4576 (= res!21700 (validMask!0 mask!2294))))

(assert (=> start!4576 e!22605))

(assert (=> start!4576 true))

(assert (=> start!4576 tp!5272))

(declare-fun array_inv!831 (array!2473) Bool)

(assert (=> start!4576 (and (array_inv!831 _values!1501) e!22599)))

(declare-fun array_inv!832 (array!2475) Bool)

(assert (=> start!4576 (array_inv!832 _keys!1833)))

(assert (=> start!4576 tp_is_empty!1629))

(declare-fun b!35771 () Bool)

(declare-fun res!21702 () Bool)

(assert (=> b!35771 (=> (not res!21702) (not e!22605))))

(declare-datatypes ((List!946 0))(
  ( (Nil!943) (Cons!942 (h!1509 (_ BitVec 64)) (t!3657 List!946)) )
))
(declare-fun arrayNoDuplicates!0 (array!2475 (_ BitVec 32) List!946) Bool)

(assert (=> b!35771 (= res!21702 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!943))))

(declare-fun b!35778 () Bool)

(declare-fun res!21704 () Bool)

(assert (=> b!35778 (=> (not res!21704) (not e!22605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!35778 (= res!21704 (validKeyInArray!0 k0!1304))))

(declare-fun b!35779 () Bool)

(assert (=> b!35779 (= e!22605 e!22604)))

(declare-fun res!21705 () Bool)

(assert (=> b!35779 (=> (not res!21705) (not e!22604))))

(assert (=> b!35779 (= res!21705 (not (contains!429 lt!13204 k0!1304)))))

(declare-fun getCurrentListMap!304 (array!2475 array!2473 (_ BitVec 32) (_ BitVec 32) V!1997 V!1997 (_ BitVec 32) Int) ListLongMap!929)

(assert (=> b!35779 (= lt!13204 (getCurrentListMap!304 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(assert (= (and start!4576 res!21700) b!35775))

(assert (= (and b!35775 res!21701) b!35773))

(assert (= (and b!35773 res!21699) b!35771))

(assert (= (and b!35771 res!21702) b!35778))

(assert (= (and b!35778 res!21704) b!35779))

(assert (= (and b!35779 res!21705) b!35777))

(assert (= (and b!35777 res!21706) b!35770))

(assert (= (and b!35770 res!21703) b!35774))

(assert (= (and b!35769 condMapEmpty!1999) mapIsEmpty!1999))

(assert (= (and b!35769 (not condMapEmpty!1999)) mapNonEmpty!1999))

(assert (= (and mapNonEmpty!1999 ((_ is ValueCellFull!615) mapValue!1999)) b!35776))

(assert (= (and b!35769 ((_ is ValueCellFull!615) mapDefault!1999)) b!35772))

(assert (= start!4576 b!35769))

(declare-fun m!28753 () Bool)

(assert (=> b!35773 m!28753))

(declare-fun m!28755 () Bool)

(assert (=> b!35774 m!28755))

(assert (=> b!35774 m!28755))

(declare-fun m!28757 () Bool)

(assert (=> b!35774 m!28757))

(declare-fun m!28759 () Bool)

(assert (=> b!35774 m!28759))

(declare-fun m!28761 () Bool)

(assert (=> b!35770 m!28761))

(declare-fun m!28763 () Bool)

(assert (=> b!35778 m!28763))

(declare-fun m!28765 () Bool)

(assert (=> start!4576 m!28765))

(declare-fun m!28767 () Bool)

(assert (=> start!4576 m!28767))

(declare-fun m!28769 () Bool)

(assert (=> start!4576 m!28769))

(declare-fun m!28771 () Bool)

(assert (=> b!35771 m!28771))

(declare-fun m!28773 () Bool)

(assert (=> b!35779 m!28773))

(declare-fun m!28775 () Bool)

(assert (=> b!35779 m!28775))

(declare-fun m!28777 () Bool)

(assert (=> mapNonEmpty!1999 m!28777))

(declare-fun m!28779 () Bool)

(assert (=> b!35777 m!28779))

(check-sat (not b!35771) (not b!35774) tp_is_empty!1629 (not b_next!1275) (not b!35777) (not b!35778) (not b!35773) (not mapNonEmpty!1999) (not b!35779) (not start!4576) b_and!2103 (not b!35770))
(check-sat b_and!2103 (not b_next!1275))
