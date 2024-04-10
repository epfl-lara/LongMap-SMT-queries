; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82518 () Bool)

(assert start!82518)

(declare-fun mapNonEmpty!34174 () Bool)

(declare-fun mapRes!34174 () Bool)

(declare-fun tp!65103 () Bool)

(declare-fun e!542266 () Bool)

(assert (=> mapNonEmpty!34174 (= mapRes!34174 (and tp!65103 e!542266))))

(declare-datatypes ((V!33587 0))(
  ( (V!33588 (val!10777 Int)) )
))
(declare-datatypes ((ValueCell!10245 0))(
  ( (ValueCellFull!10245 (v!13335 V!33587)) (EmptyCell!10245) )
))
(declare-fun mapValue!34174 () ValueCell!10245)

(declare-fun mapRest!34174 () (Array (_ BitVec 32) ValueCell!10245))

(declare-fun mapKey!34174 () (_ BitVec 32))

(declare-datatypes ((array!59003 0))(
  ( (array!59004 (arr!28370 (Array (_ BitVec 32) ValueCell!10245)) (size!28849 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59003)

(assert (=> mapNonEmpty!34174 (= (arr!28370 _values!1400) (store mapRest!34174 mapKey!34174 mapValue!34174))))

(declare-fun res!643574 () Bool)

(declare-fun e!542269 () Bool)

(assert (=> start!82518 (=> (not res!643574) (not e!542269))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82518 (= res!643574 (validMask!0 mask!2110))))

(assert (=> start!82518 e!542269))

(assert (=> start!82518 true))

(declare-fun e!542270 () Bool)

(declare-fun array_inv!21985 (array!59003) Bool)

(assert (=> start!82518 (and (array_inv!21985 _values!1400) e!542270)))

(declare-datatypes ((array!59005 0))(
  ( (array!59006 (arr!28371 (Array (_ BitVec 32) (_ BitVec 64))) (size!28850 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59005)

(declare-fun array_inv!21986 (array!59005) Bool)

(assert (=> start!82518 (array_inv!21986 _keys!1686)))

(declare-fun mapIsEmpty!34174 () Bool)

(assert (=> mapIsEmpty!34174 mapRes!34174))

(declare-fun b!961640 () Bool)

(declare-fun e!542267 () Bool)

(declare-fun tp_is_empty!21453 () Bool)

(assert (=> b!961640 (= e!542267 tp_is_empty!21453)))

(declare-fun b!961641 () Bool)

(assert (=> b!961641 (= e!542270 (and e!542267 mapRes!34174))))

(declare-fun condMapEmpty!34174 () Bool)

(declare-fun mapDefault!34174 () ValueCell!10245)

(assert (=> b!961641 (= condMapEmpty!34174 (= (arr!28370 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10245)) mapDefault!34174)))))

(declare-fun b!961642 () Bool)

(assert (=> b!961642 (= e!542266 tp_is_empty!21453)))

(declare-fun b!961643 () Bool)

(declare-fun res!643576 () Bool)

(assert (=> b!961643 (=> (not res!643576) (not e!542269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59005 (_ BitVec 32)) Bool)

(assert (=> b!961643 (= res!643576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961644 () Bool)

(assert (=> b!961644 (= e!542269 false)))

(declare-fun lt!430789 () Bool)

(declare-datatypes ((List!19697 0))(
  ( (Nil!19694) (Cons!19693 (h!20855 (_ BitVec 64)) (t!28060 List!19697)) )
))
(declare-fun arrayNoDuplicates!0 (array!59005 (_ BitVec 32) List!19697) Bool)

(assert (=> b!961644 (= lt!430789 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19694))))

(declare-fun b!961645 () Bool)

(declare-fun res!643575 () Bool)

(assert (=> b!961645 (=> (not res!643575) (not e!542269))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961645 (= res!643575 (and (= (size!28849 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28850 _keys!1686) (size!28849 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82518 res!643574) b!961645))

(assert (= (and b!961645 res!643575) b!961643))

(assert (= (and b!961643 res!643576) b!961644))

(assert (= (and b!961641 condMapEmpty!34174) mapIsEmpty!34174))

(assert (= (and b!961641 (not condMapEmpty!34174)) mapNonEmpty!34174))

(get-info :version)

(assert (= (and mapNonEmpty!34174 ((_ is ValueCellFull!10245) mapValue!34174)) b!961642))

(assert (= (and b!961641 ((_ is ValueCellFull!10245) mapDefault!34174)) b!961640))

(assert (= start!82518 b!961641))

(declare-fun m!891525 () Bool)

(assert (=> mapNonEmpty!34174 m!891525))

(declare-fun m!891527 () Bool)

(assert (=> start!82518 m!891527))

(declare-fun m!891529 () Bool)

(assert (=> start!82518 m!891529))

(declare-fun m!891531 () Bool)

(assert (=> start!82518 m!891531))

(declare-fun m!891533 () Bool)

(assert (=> b!961643 m!891533))

(declare-fun m!891535 () Bool)

(assert (=> b!961644 m!891535))

(check-sat (not mapNonEmpty!34174) (not b!961643) tp_is_empty!21453 (not start!82518) (not b!961644))
(check-sat)
