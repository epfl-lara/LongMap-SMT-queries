; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108432 () Bool)

(assert start!108432)

(declare-fun b_free!27979 () Bool)

(declare-fun b_next!27979 () Bool)

(assert (=> start!108432 (= b_free!27979 (not b_next!27979))))

(declare-fun tp!99047 () Bool)

(declare-fun b_and!46021 () Bool)

(assert (=> start!108432 (= tp!99047 b_and!46021)))

(declare-fun b!1279697 () Bool)

(declare-fun e!731181 () Bool)

(declare-fun e!731179 () Bool)

(declare-fun mapRes!51980 () Bool)

(assert (=> b!1279697 (= e!731181 (and e!731179 mapRes!51980))))

(declare-fun condMapEmpty!51980 () Bool)

(declare-datatypes ((V!49929 0))(
  ( (V!49930 (val!16884 Int)) )
))
(declare-datatypes ((ValueCell!15911 0))(
  ( (ValueCellFull!15911 (v!19483 V!49929)) (EmptyCell!15911) )
))
(declare-datatypes ((array!84213 0))(
  ( (array!84214 (arr!40611 (Array (_ BitVec 32) ValueCell!15911)) (size!41163 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84213)

(declare-fun mapDefault!51980 () ValueCell!15911)

(assert (=> b!1279697 (= condMapEmpty!51980 (= (arr!40611 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15911)) mapDefault!51980)))))

(declare-fun b!1279698 () Bool)

(declare-fun res!850087 () Bool)

(declare-fun e!731178 () Bool)

(assert (=> b!1279698 (=> (not res!850087) (not e!731178))))

(declare-datatypes ((array!84215 0))(
  ( (array!84216 (arr!40612 (Array (_ BitVec 32) (_ BitVec 64))) (size!41164 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84215)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84215 (_ BitVec 32)) Bool)

(assert (=> b!1279698 (= res!850087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279699 () Bool)

(assert (=> b!1279699 (= e!731178 false)))

(declare-fun minValue!1387 () V!49929)

(declare-fun zeroValue!1387 () V!49929)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!575863 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21682 0))(
  ( (tuple2!21683 (_1!10852 (_ BitVec 64)) (_2!10852 V!49929)) )
))
(declare-datatypes ((List!28871 0))(
  ( (Nil!28868) (Cons!28867 (h!30076 tuple2!21682) (t!42403 List!28871)) )
))
(declare-datatypes ((ListLongMap!19339 0))(
  ( (ListLongMap!19340 (toList!9685 List!28871)) )
))
(declare-fun contains!7730 (ListLongMap!19339 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4659 (array!84215 array!84213 (_ BitVec 32) (_ BitVec 32) V!49929 V!49929 (_ BitVec 32) Int) ListLongMap!19339)

(assert (=> b!1279699 (= lt!575863 (contains!7730 (getCurrentListMap!4659 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1279700 () Bool)

(declare-fun res!850085 () Bool)

(assert (=> b!1279700 (=> (not res!850085) (not e!731178))))

(assert (=> b!1279700 (= res!850085 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41164 _keys!1741))))))

(declare-fun b!1279701 () Bool)

(declare-fun res!850086 () Bool)

(assert (=> b!1279701 (=> (not res!850086) (not e!731178))))

(declare-datatypes ((List!28872 0))(
  ( (Nil!28869) (Cons!28868 (h!30077 (_ BitVec 64)) (t!42404 List!28872)) )
))
(declare-fun arrayNoDuplicates!0 (array!84215 (_ BitVec 32) List!28872) Bool)

(assert (=> b!1279701 (= res!850086 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28869))))

(declare-fun b!1279702 () Bool)

(declare-fun res!850084 () Bool)

(assert (=> b!1279702 (=> (not res!850084) (not e!731178))))

(assert (=> b!1279702 (= res!850084 (and (= (size!41163 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41164 _keys!1741) (size!41163 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51980 () Bool)

(assert (=> mapIsEmpty!51980 mapRes!51980))

(declare-fun res!850088 () Bool)

(assert (=> start!108432 (=> (not res!850088) (not e!731178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108432 (= res!850088 (validMask!0 mask!2175))))

(assert (=> start!108432 e!731178))

(declare-fun tp_is_empty!33619 () Bool)

(assert (=> start!108432 tp_is_empty!33619))

(assert (=> start!108432 true))

(declare-fun array_inv!30995 (array!84213) Bool)

(assert (=> start!108432 (and (array_inv!30995 _values!1445) e!731181)))

(declare-fun array_inv!30996 (array!84215) Bool)

(assert (=> start!108432 (array_inv!30996 _keys!1741)))

(assert (=> start!108432 tp!99047))

(declare-fun mapNonEmpty!51980 () Bool)

(declare-fun tp!99048 () Bool)

(declare-fun e!731180 () Bool)

(assert (=> mapNonEmpty!51980 (= mapRes!51980 (and tp!99048 e!731180))))

(declare-fun mapRest!51980 () (Array (_ BitVec 32) ValueCell!15911))

(declare-fun mapKey!51980 () (_ BitVec 32))

(declare-fun mapValue!51980 () ValueCell!15911)

(assert (=> mapNonEmpty!51980 (= (arr!40611 _values!1445) (store mapRest!51980 mapKey!51980 mapValue!51980))))

(declare-fun b!1279703 () Bool)

(assert (=> b!1279703 (= e!731179 tp_is_empty!33619)))

(declare-fun b!1279704 () Bool)

(assert (=> b!1279704 (= e!731180 tp_is_empty!33619)))

(assert (= (and start!108432 res!850088) b!1279702))

(assert (= (and b!1279702 res!850084) b!1279698))

(assert (= (and b!1279698 res!850087) b!1279701))

(assert (= (and b!1279701 res!850086) b!1279700))

(assert (= (and b!1279700 res!850085) b!1279699))

(assert (= (and b!1279697 condMapEmpty!51980) mapIsEmpty!51980))

(assert (= (and b!1279697 (not condMapEmpty!51980)) mapNonEmpty!51980))

(get-info :version)

(assert (= (and mapNonEmpty!51980 ((_ is ValueCellFull!15911) mapValue!51980)) b!1279704))

(assert (= (and b!1279697 ((_ is ValueCellFull!15911) mapDefault!51980)) b!1279703))

(assert (= start!108432 b!1279697))

(declare-fun m!1174113 () Bool)

(assert (=> b!1279698 m!1174113))

(declare-fun m!1174115 () Bool)

(assert (=> b!1279701 m!1174115))

(declare-fun m!1174117 () Bool)

(assert (=> start!108432 m!1174117))

(declare-fun m!1174119 () Bool)

(assert (=> start!108432 m!1174119))

(declare-fun m!1174121 () Bool)

(assert (=> start!108432 m!1174121))

(declare-fun m!1174123 () Bool)

(assert (=> mapNonEmpty!51980 m!1174123))

(declare-fun m!1174125 () Bool)

(assert (=> b!1279699 m!1174125))

(assert (=> b!1279699 m!1174125))

(declare-fun m!1174127 () Bool)

(assert (=> b!1279699 m!1174127))

(check-sat (not b_next!27979) (not b!1279698) b_and!46021 (not start!108432) (not b!1279701) tp_is_empty!33619 (not mapNonEmpty!51980) (not b!1279699))
(check-sat b_and!46021 (not b_next!27979))
