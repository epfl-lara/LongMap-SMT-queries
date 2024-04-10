; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82330 () Bool)

(assert start!82330)

(declare-fun b_free!18597 () Bool)

(declare-fun b_next!18597 () Bool)

(assert (=> start!82330 (= b_free!18597 (not b_next!18597))))

(declare-fun tp!64761 () Bool)

(declare-fun b_and!30085 () Bool)

(assert (=> start!82330 (= tp!64761 b_and!30085)))

(declare-fun mapNonEmpty!33943 () Bool)

(declare-fun mapRes!33943 () Bool)

(declare-fun tp!64760 () Bool)

(declare-fun e!541094 () Bool)

(assert (=> mapNonEmpty!33943 (= mapRes!33943 (and tp!64760 e!541094))))

(declare-datatypes ((V!33395 0))(
  ( (V!33396 (val!10705 Int)) )
))
(declare-datatypes ((ValueCell!10173 0))(
  ( (ValueCellFull!10173 (v!13262 V!33395)) (EmptyCell!10173) )
))
(declare-fun mapValue!33943 () ValueCell!10173)

(declare-fun mapKey!33943 () (_ BitVec 32))

(declare-datatypes ((array!58709 0))(
  ( (array!58710 (arr!28228 (Array (_ BitVec 32) ValueCell!10173)) (size!28707 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58709)

(declare-fun mapRest!33943 () (Array (_ BitVec 32) ValueCell!10173))

(assert (=> mapNonEmpty!33943 (= (arr!28228 _values!1386) (store mapRest!33943 mapKey!33943 mapValue!33943))))

(declare-fun b!959883 () Bool)

(declare-fun res!642529 () Bool)

(declare-fun e!541093 () Bool)

(assert (=> b!959883 (=> (not res!642529) (not e!541093))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58711 0))(
  ( (array!58712 (arr!28229 (Array (_ BitVec 32) (_ BitVec 64))) (size!28708 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58711)

(assert (=> b!959883 (= res!642529 (and (= (size!28707 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28708 _keys!1668) (size!28707 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959884 () Bool)

(declare-fun res!642528 () Bool)

(assert (=> b!959884 (=> (not res!642528) (not e!541093))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959884 (= res!642528 (validKeyInArray!0 (select (arr!28229 _keys!1668) i!793)))))

(declare-fun b!959885 () Bool)

(declare-fun e!541092 () Bool)

(declare-fun tp_is_empty!21309 () Bool)

(assert (=> b!959885 (= e!541092 tp_is_empty!21309)))

(declare-fun mapIsEmpty!33943 () Bool)

(assert (=> mapIsEmpty!33943 mapRes!33943))

(declare-fun b!959886 () Bool)

(assert (=> b!959886 (= e!541093 false)))

(declare-fun minValue!1328 () V!33395)

(declare-fun lt!430587 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33395)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13810 0))(
  ( (tuple2!13811 (_1!6916 (_ BitVec 64)) (_2!6916 V!33395)) )
))
(declare-datatypes ((List!19629 0))(
  ( (Nil!19626) (Cons!19625 (h!20787 tuple2!13810) (t!27992 List!19629)) )
))
(declare-datatypes ((ListLongMap!12507 0))(
  ( (ListLongMap!12508 (toList!6269 List!19629)) )
))
(declare-fun contains!5368 (ListLongMap!12507 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3502 (array!58711 array!58709 (_ BitVec 32) (_ BitVec 32) V!33395 V!33395 (_ BitVec 32) Int) ListLongMap!12507)

(assert (=> b!959886 (= lt!430587 (contains!5368 (getCurrentListMap!3502 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28229 _keys!1668) i!793)))))

(declare-fun b!959887 () Bool)

(declare-fun res!642532 () Bool)

(assert (=> b!959887 (=> (not res!642532) (not e!541093))))

(declare-datatypes ((List!19630 0))(
  ( (Nil!19627) (Cons!19626 (h!20788 (_ BitVec 64)) (t!27993 List!19630)) )
))
(declare-fun arrayNoDuplicates!0 (array!58711 (_ BitVec 32) List!19630) Bool)

(assert (=> b!959887 (= res!642532 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19627))))

(declare-fun b!959888 () Bool)

(declare-fun res!642531 () Bool)

(assert (=> b!959888 (=> (not res!642531) (not e!541093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58711 (_ BitVec 32)) Bool)

(assert (=> b!959888 (= res!642531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959889 () Bool)

(assert (=> b!959889 (= e!541094 tp_is_empty!21309)))

(declare-fun b!959890 () Bool)

(declare-fun e!541095 () Bool)

(assert (=> b!959890 (= e!541095 (and e!541092 mapRes!33943))))

(declare-fun condMapEmpty!33943 () Bool)

(declare-fun mapDefault!33943 () ValueCell!10173)

(assert (=> b!959890 (= condMapEmpty!33943 (= (arr!28228 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10173)) mapDefault!33943)))))

(declare-fun b!959882 () Bool)

(declare-fun res!642530 () Bool)

(assert (=> b!959882 (=> (not res!642530) (not e!541093))))

(assert (=> b!959882 (= res!642530 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28708 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28708 _keys!1668))))))

(declare-fun res!642533 () Bool)

(assert (=> start!82330 (=> (not res!642533) (not e!541093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82330 (= res!642533 (validMask!0 mask!2088))))

(assert (=> start!82330 e!541093))

(assert (=> start!82330 true))

(assert (=> start!82330 tp_is_empty!21309))

(declare-fun array_inv!21877 (array!58711) Bool)

(assert (=> start!82330 (array_inv!21877 _keys!1668)))

(declare-fun array_inv!21878 (array!58709) Bool)

(assert (=> start!82330 (and (array_inv!21878 _values!1386) e!541095)))

(assert (=> start!82330 tp!64761))

(assert (= (and start!82330 res!642533) b!959883))

(assert (= (and b!959883 res!642529) b!959888))

(assert (= (and b!959888 res!642531) b!959887))

(assert (= (and b!959887 res!642532) b!959882))

(assert (= (and b!959882 res!642530) b!959884))

(assert (= (and b!959884 res!642528) b!959886))

(assert (= (and b!959890 condMapEmpty!33943) mapIsEmpty!33943))

(assert (= (and b!959890 (not condMapEmpty!33943)) mapNonEmpty!33943))

(get-info :version)

(assert (= (and mapNonEmpty!33943 ((_ is ValueCellFull!10173) mapValue!33943)) b!959889))

(assert (= (and b!959890 ((_ is ValueCellFull!10173) mapDefault!33943)) b!959885))

(assert (= start!82330 b!959890))

(declare-fun m!890269 () Bool)

(assert (=> b!959886 m!890269))

(declare-fun m!890271 () Bool)

(assert (=> b!959886 m!890271))

(assert (=> b!959886 m!890269))

(assert (=> b!959886 m!890271))

(declare-fun m!890273 () Bool)

(assert (=> b!959886 m!890273))

(assert (=> b!959884 m!890271))

(assert (=> b!959884 m!890271))

(declare-fun m!890275 () Bool)

(assert (=> b!959884 m!890275))

(declare-fun m!890277 () Bool)

(assert (=> b!959888 m!890277))

(declare-fun m!890279 () Bool)

(assert (=> b!959887 m!890279))

(declare-fun m!890281 () Bool)

(assert (=> mapNonEmpty!33943 m!890281))

(declare-fun m!890283 () Bool)

(assert (=> start!82330 m!890283))

(declare-fun m!890285 () Bool)

(assert (=> start!82330 m!890285))

(declare-fun m!890287 () Bool)

(assert (=> start!82330 m!890287))

(check-sat b_and!30085 (not start!82330) (not b!959888) (not b!959886) tp_is_empty!21309 (not mapNonEmpty!33943) (not b!959884) (not b!959887) (not b_next!18597))
(check-sat b_and!30085 (not b_next!18597))
