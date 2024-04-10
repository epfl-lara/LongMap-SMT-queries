; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83126 () Bool)

(assert start!83126)

(declare-fun b_free!19119 () Bool)

(declare-fun b_next!19119 () Bool)

(assert (=> start!83126 (= b_free!19119 (not b_next!19119))))

(declare-fun tp!66636 () Bool)

(declare-fun b_and!30607 () Bool)

(assert (=> start!83126 (= tp!66636 b_and!30607)))

(declare-fun b!969701 () Bool)

(declare-fun res!649035 () Bool)

(declare-fun e!546694 () Bool)

(assert (=> b!969701 (=> (not res!649035) (not e!546694))))

(declare-datatypes ((array!60097 0))(
  ( (array!60098 (arr!28912 (Array (_ BitVec 32) (_ BitVec 64))) (size!29391 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60097)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!969701 (= res!649035 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29391 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29391 _keys!1717))))))

(declare-fun mapNonEmpty!35035 () Bool)

(declare-fun mapRes!35035 () Bool)

(declare-fun tp!66635 () Bool)

(declare-fun e!546690 () Bool)

(assert (=> mapNonEmpty!35035 (= mapRes!35035 (and tp!66635 e!546690))))

(declare-datatypes ((V!34339 0))(
  ( (V!34340 (val!11059 Int)) )
))
(declare-datatypes ((ValueCell!10527 0))(
  ( (ValueCellFull!10527 (v!13618 V!34339)) (EmptyCell!10527) )
))
(declare-datatypes ((array!60099 0))(
  ( (array!60100 (arr!28913 (Array (_ BitVec 32) ValueCell!10527)) (size!29392 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60099)

(declare-fun mapValue!35035 () ValueCell!10527)

(declare-fun mapRest!35035 () (Array (_ BitVec 32) ValueCell!10527))

(declare-fun mapKey!35035 () (_ BitVec 32))

(assert (=> mapNonEmpty!35035 (= (arr!28913 _values!1425) (store mapRest!35035 mapKey!35035 mapValue!35035))))

(declare-fun b!969702 () Bool)

(declare-fun e!546691 () Bool)

(declare-fun tp_is_empty!22017 () Bool)

(assert (=> b!969702 (= e!546691 tp_is_empty!22017)))

(declare-fun mapIsEmpty!35035 () Bool)

(assert (=> mapIsEmpty!35035 mapRes!35035))

(declare-fun b!969703 () Bool)

(declare-fun e!546693 () Bool)

(assert (=> b!969703 (= e!546693 (and e!546691 mapRes!35035))))

(declare-fun condMapEmpty!35035 () Bool)

(declare-fun mapDefault!35035 () ValueCell!10527)

(assert (=> b!969703 (= condMapEmpty!35035 (= (arr!28913 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10527)) mapDefault!35035)))))

(declare-fun b!969704 () Bool)

(declare-fun res!649037 () Bool)

(assert (=> b!969704 (=> (not res!649037) (not e!546694))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969704 (= res!649037 (and (= (size!29392 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29391 _keys!1717) (size!29392 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969706 () Bool)

(declare-fun res!649036 () Bool)

(assert (=> b!969706 (=> (not res!649036) (not e!546694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60097 (_ BitVec 32)) Bool)

(assert (=> b!969706 (= res!649036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969707 () Bool)

(declare-fun res!649034 () Bool)

(assert (=> b!969707 (=> (not res!649034) (not e!546694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969707 (= res!649034 (validKeyInArray!0 (select (arr!28912 _keys!1717) i!822)))))

(declare-fun b!969708 () Bool)

(assert (=> b!969708 (= e!546694 false)))

(declare-fun zeroValue!1367 () V!34339)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34339)

(declare-fun lt!431666 () Bool)

(declare-datatypes ((tuple2!14168 0))(
  ( (tuple2!14169 (_1!7095 (_ BitVec 64)) (_2!7095 V!34339)) )
))
(declare-datatypes ((List!20036 0))(
  ( (Nil!20033) (Cons!20032 (h!21194 tuple2!14168) (t!28399 List!20036)) )
))
(declare-datatypes ((ListLongMap!12865 0))(
  ( (ListLongMap!12866 (toList!6448 List!20036)) )
))
(declare-fun contains!5552 (ListLongMap!12865 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3681 (array!60097 array!60099 (_ BitVec 32) (_ BitVec 32) V!34339 V!34339 (_ BitVec 32) Int) ListLongMap!12865)

(assert (=> b!969708 (= lt!431666 (contains!5552 (getCurrentListMap!3681 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28912 _keys!1717) i!822)))))

(declare-fun b!969709 () Bool)

(assert (=> b!969709 (= e!546690 tp_is_empty!22017)))

(declare-fun b!969705 () Bool)

(declare-fun res!649033 () Bool)

(assert (=> b!969705 (=> (not res!649033) (not e!546694))))

(declare-datatypes ((List!20037 0))(
  ( (Nil!20034) (Cons!20033 (h!21195 (_ BitVec 64)) (t!28400 List!20037)) )
))
(declare-fun arrayNoDuplicates!0 (array!60097 (_ BitVec 32) List!20037) Bool)

(assert (=> b!969705 (= res!649033 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20034))))

(declare-fun res!649038 () Bool)

(assert (=> start!83126 (=> (not res!649038) (not e!546694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83126 (= res!649038 (validMask!0 mask!2147))))

(assert (=> start!83126 e!546694))

(assert (=> start!83126 true))

(declare-fun array_inv!22379 (array!60099) Bool)

(assert (=> start!83126 (and (array_inv!22379 _values!1425) e!546693)))

(assert (=> start!83126 tp_is_empty!22017))

(assert (=> start!83126 tp!66636))

(declare-fun array_inv!22380 (array!60097) Bool)

(assert (=> start!83126 (array_inv!22380 _keys!1717)))

(assert (= (and start!83126 res!649038) b!969704))

(assert (= (and b!969704 res!649037) b!969706))

(assert (= (and b!969706 res!649036) b!969705))

(assert (= (and b!969705 res!649033) b!969701))

(assert (= (and b!969701 res!649035) b!969707))

(assert (= (and b!969707 res!649034) b!969708))

(assert (= (and b!969703 condMapEmpty!35035) mapIsEmpty!35035))

(assert (= (and b!969703 (not condMapEmpty!35035)) mapNonEmpty!35035))

(get-info :version)

(assert (= (and mapNonEmpty!35035 ((_ is ValueCellFull!10527) mapValue!35035)) b!969709))

(assert (= (and b!969703 ((_ is ValueCellFull!10527) mapDefault!35035)) b!969702))

(assert (= start!83126 b!969703))

(declare-fun m!897627 () Bool)

(assert (=> b!969708 m!897627))

(declare-fun m!897629 () Bool)

(assert (=> b!969708 m!897629))

(assert (=> b!969708 m!897627))

(assert (=> b!969708 m!897629))

(declare-fun m!897631 () Bool)

(assert (=> b!969708 m!897631))

(declare-fun m!897633 () Bool)

(assert (=> b!969706 m!897633))

(assert (=> b!969707 m!897629))

(assert (=> b!969707 m!897629))

(declare-fun m!897635 () Bool)

(assert (=> b!969707 m!897635))

(declare-fun m!897637 () Bool)

(assert (=> start!83126 m!897637))

(declare-fun m!897639 () Bool)

(assert (=> start!83126 m!897639))

(declare-fun m!897641 () Bool)

(assert (=> start!83126 m!897641))

(declare-fun m!897643 () Bool)

(assert (=> mapNonEmpty!35035 m!897643))

(declare-fun m!897645 () Bool)

(assert (=> b!969705 m!897645))

(check-sat (not start!83126) b_and!30607 (not b!969706) (not b_next!19119) (not b!969705) tp_is_empty!22017 (not b!969707) (not mapNonEmpty!35035) (not b!969708))
(check-sat b_and!30607 (not b_next!19119))
