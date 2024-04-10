; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40636 () Bool)

(assert start!40636)

(declare-fun b_free!10647 () Bool)

(declare-fun b_next!10647 () Bool)

(assert (=> start!40636 (= b_free!10647 (not b_next!10647))))

(declare-fun tp!37761 () Bool)

(declare-fun b_and!18655 () Bool)

(assert (=> start!40636 (= tp!37761 b_and!18655)))

(declare-fun b!448727 () Bool)

(declare-fun res!266766 () Bool)

(declare-fun e!263242 () Bool)

(assert (=> b!448727 (=> (not res!266766) (not e!263242))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448727 (= res!266766 (validMask!0 mask!1025))))

(declare-fun b!448728 () Bool)

(declare-fun e!263244 () Bool)

(declare-fun tp_is_empty!11985 () Bool)

(assert (=> b!448728 (= e!263244 tp_is_empty!11985)))

(declare-fun b!448729 () Bool)

(declare-fun e!263241 () Bool)

(assert (=> b!448729 (= e!263242 e!263241)))

(declare-fun res!266770 () Bool)

(assert (=> b!448729 (=> (not res!266770) (not e!263241))))

(declare-datatypes ((array!27777 0))(
  ( (array!27778 (arr!13334 (Array (_ BitVec 32) (_ BitVec 64))) (size!13686 (_ BitVec 32))) )
))
(declare-fun lt!204223 () array!27777)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27777 (_ BitVec 32)) Bool)

(assert (=> b!448729 (= res!266770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204223 mask!1025))))

(declare-fun _keys!709 () array!27777)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448729 (= lt!204223 (array!27778 (store (arr!13334 _keys!709) i!563 k0!794) (size!13686 _keys!709)))))

(declare-fun b!448730 () Bool)

(declare-fun res!266773 () Bool)

(assert (=> b!448730 (=> (not res!266773) (not e!263242))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17085 0))(
  ( (V!17086 (val!6037 Int)) )
))
(declare-datatypes ((ValueCell!5649 0))(
  ( (ValueCellFull!5649 (v!8292 V!17085)) (EmptyCell!5649) )
))
(declare-datatypes ((array!27779 0))(
  ( (array!27780 (arr!13335 (Array (_ BitVec 32) ValueCell!5649)) (size!13687 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27779)

(assert (=> b!448730 (= res!266773 (and (= (size!13687 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13686 _keys!709) (size!13687 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19611 () Bool)

(declare-fun mapRes!19611 () Bool)

(assert (=> mapIsEmpty!19611 mapRes!19611))

(declare-fun b!448731 () Bool)

(declare-fun e!263243 () Bool)

(declare-fun e!263245 () Bool)

(assert (=> b!448731 (= e!263243 (and e!263245 mapRes!19611))))

(declare-fun condMapEmpty!19611 () Bool)

(declare-fun mapDefault!19611 () ValueCell!5649)

(assert (=> b!448731 (= condMapEmpty!19611 (= (arr!13335 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5649)) mapDefault!19611)))))

(declare-fun mapNonEmpty!19611 () Bool)

(declare-fun tp!37760 () Bool)

(assert (=> mapNonEmpty!19611 (= mapRes!19611 (and tp!37760 e!263244))))

(declare-fun mapRest!19611 () (Array (_ BitVec 32) ValueCell!5649))

(declare-fun mapValue!19611 () ValueCell!5649)

(declare-fun mapKey!19611 () (_ BitVec 32))

(assert (=> mapNonEmpty!19611 (= (arr!13335 _values!549) (store mapRest!19611 mapKey!19611 mapValue!19611))))

(declare-fun res!266772 () Bool)

(assert (=> start!40636 (=> (not res!266772) (not e!263242))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40636 (= res!266772 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13686 _keys!709))))))

(assert (=> start!40636 e!263242))

(assert (=> start!40636 tp_is_empty!11985))

(assert (=> start!40636 tp!37761))

(assert (=> start!40636 true))

(declare-fun array_inv!9664 (array!27779) Bool)

(assert (=> start!40636 (and (array_inv!9664 _values!549) e!263243)))

(declare-fun array_inv!9665 (array!27777) Bool)

(assert (=> start!40636 (array_inv!9665 _keys!709)))

(declare-fun b!448732 () Bool)

(declare-fun res!266767 () Bool)

(assert (=> b!448732 (=> (not res!266767) (not e!263242))))

(declare-fun arrayContainsKey!0 (array!27777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448732 (= res!266767 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448733 () Bool)

(declare-fun res!266769 () Bool)

(assert (=> b!448733 (=> (not res!266769) (not e!263242))))

(assert (=> b!448733 (= res!266769 (or (= (select (arr!13334 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13334 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448734 () Bool)

(assert (=> b!448734 (= e!263241 false)))

(declare-fun minValue!515 () V!17085)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17085)

(declare-datatypes ((tuple2!7922 0))(
  ( (tuple2!7923 (_1!3972 (_ BitVec 64)) (_2!3972 V!17085)) )
))
(declare-datatypes ((List!7987 0))(
  ( (Nil!7984) (Cons!7983 (h!8839 tuple2!7922) (t!13749 List!7987)) )
))
(declare-datatypes ((ListLongMap!6835 0))(
  ( (ListLongMap!6836 (toList!3433 List!7987)) )
))
(declare-fun lt!204225 () ListLongMap!6835)

(declare-fun v!412 () V!17085)

(declare-fun getCurrentListMapNoExtraKeys!1619 (array!27777 array!27779 (_ BitVec 32) (_ BitVec 32) V!17085 V!17085 (_ BitVec 32) Int) ListLongMap!6835)

(assert (=> b!448734 (= lt!204225 (getCurrentListMapNoExtraKeys!1619 lt!204223 (array!27780 (store (arr!13335 _values!549) i!563 (ValueCellFull!5649 v!412)) (size!13687 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204224 () ListLongMap!6835)

(assert (=> b!448734 (= lt!204224 (getCurrentListMapNoExtraKeys!1619 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448735 () Bool)

(declare-fun res!266771 () Bool)

(assert (=> b!448735 (=> (not res!266771) (not e!263242))))

(assert (=> b!448735 (= res!266771 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13686 _keys!709))))))

(declare-fun b!448736 () Bool)

(declare-fun res!266774 () Bool)

(assert (=> b!448736 (=> (not res!266774) (not e!263242))))

(assert (=> b!448736 (= res!266774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448737 () Bool)

(assert (=> b!448737 (= e!263245 tp_is_empty!11985)))

(declare-fun b!448738 () Bool)

(declare-fun res!266768 () Bool)

(assert (=> b!448738 (=> (not res!266768) (not e!263242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448738 (= res!266768 (validKeyInArray!0 k0!794))))

(declare-fun b!448739 () Bool)

(declare-fun res!266775 () Bool)

(assert (=> b!448739 (=> (not res!266775) (not e!263241))))

(declare-datatypes ((List!7988 0))(
  ( (Nil!7985) (Cons!7984 (h!8840 (_ BitVec 64)) (t!13750 List!7988)) )
))
(declare-fun arrayNoDuplicates!0 (array!27777 (_ BitVec 32) List!7988) Bool)

(assert (=> b!448739 (= res!266775 (arrayNoDuplicates!0 lt!204223 #b00000000000000000000000000000000 Nil!7985))))

(declare-fun b!448740 () Bool)

(declare-fun res!266764 () Bool)

(assert (=> b!448740 (=> (not res!266764) (not e!263241))))

(assert (=> b!448740 (= res!266764 (bvsle from!863 i!563))))

(declare-fun b!448741 () Bool)

(declare-fun res!266765 () Bool)

(assert (=> b!448741 (=> (not res!266765) (not e!263242))))

(assert (=> b!448741 (= res!266765 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7985))))

(assert (= (and start!40636 res!266772) b!448727))

(assert (= (and b!448727 res!266766) b!448730))

(assert (= (and b!448730 res!266773) b!448736))

(assert (= (and b!448736 res!266774) b!448741))

(assert (= (and b!448741 res!266765) b!448735))

(assert (= (and b!448735 res!266771) b!448738))

(assert (= (and b!448738 res!266768) b!448733))

(assert (= (and b!448733 res!266769) b!448732))

(assert (= (and b!448732 res!266767) b!448729))

(assert (= (and b!448729 res!266770) b!448739))

(assert (= (and b!448739 res!266775) b!448740))

(assert (= (and b!448740 res!266764) b!448734))

(assert (= (and b!448731 condMapEmpty!19611) mapIsEmpty!19611))

(assert (= (and b!448731 (not condMapEmpty!19611)) mapNonEmpty!19611))

(get-info :version)

(assert (= (and mapNonEmpty!19611 ((_ is ValueCellFull!5649) mapValue!19611)) b!448728))

(assert (= (and b!448731 ((_ is ValueCellFull!5649) mapDefault!19611)) b!448737))

(assert (= start!40636 b!448731))

(declare-fun m!433183 () Bool)

(assert (=> b!448736 m!433183))

(declare-fun m!433185 () Bool)

(assert (=> b!448741 m!433185))

(declare-fun m!433187 () Bool)

(assert (=> mapNonEmpty!19611 m!433187))

(declare-fun m!433189 () Bool)

(assert (=> b!448733 m!433189))

(declare-fun m!433191 () Bool)

(assert (=> b!448738 m!433191))

(declare-fun m!433193 () Bool)

(assert (=> b!448732 m!433193))

(declare-fun m!433195 () Bool)

(assert (=> start!40636 m!433195))

(declare-fun m!433197 () Bool)

(assert (=> start!40636 m!433197))

(declare-fun m!433199 () Bool)

(assert (=> b!448727 m!433199))

(declare-fun m!433201 () Bool)

(assert (=> b!448734 m!433201))

(declare-fun m!433203 () Bool)

(assert (=> b!448734 m!433203))

(declare-fun m!433205 () Bool)

(assert (=> b!448734 m!433205))

(declare-fun m!433207 () Bool)

(assert (=> b!448739 m!433207))

(declare-fun m!433209 () Bool)

(assert (=> b!448729 m!433209))

(declare-fun m!433211 () Bool)

(assert (=> b!448729 m!433211))

(check-sat (not b_next!10647) (not b!448734) (not b!448741) (not start!40636) (not b!448727) (not b!448738) (not b!448732) tp_is_empty!11985 (not b!448729) (not mapNonEmpty!19611) (not b!448739) (not b!448736) b_and!18655)
(check-sat b_and!18655 (not b_next!10647))
