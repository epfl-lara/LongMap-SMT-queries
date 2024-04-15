; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40894 () Bool)

(assert start!40894)

(declare-fun b_free!10843 () Bool)

(declare-fun b_next!10843 () Bool)

(assert (=> start!40894 (= b_free!10843 (not b_next!10843))))

(declare-fun tp!38356 () Bool)

(declare-fun b_and!18959 () Bool)

(assert (=> start!40894 (= tp!38356 b_and!18959)))

(declare-fun b!454321 () Bool)

(declare-fun res!270767 () Bool)

(declare-fun e!265767 () Bool)

(assert (=> b!454321 (=> (not res!270767) (not e!265767))))

(declare-datatypes ((array!28159 0))(
  ( (array!28160 (arr!13523 (Array (_ BitVec 32) (_ BitVec 64))) (size!13876 (_ BitVec 32))) )
))
(declare-fun lt!205933 () array!28159)

(declare-datatypes ((List!8153 0))(
  ( (Nil!8150) (Cons!8149 (h!9005 (_ BitVec 64)) (t!13972 List!8153)) )
))
(declare-fun arrayNoDuplicates!0 (array!28159 (_ BitVec 32) List!8153) Bool)

(assert (=> b!454321 (= res!270767 (arrayNoDuplicates!0 lt!205933 #b00000000000000000000000000000000 Nil!8150))))

(declare-fun b!454322 () Bool)

(declare-fun res!270763 () Bool)

(declare-fun e!265768 () Bool)

(assert (=> b!454322 (=> (not res!270763) (not e!265768))))

(declare-fun _keys!709 () array!28159)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28159 (_ BitVec 32)) Bool)

(assert (=> b!454322 (= res!270763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454323 () Bool)

(assert (=> b!454323 (= e!265768 e!265767)))

(declare-fun res!270760 () Bool)

(assert (=> b!454323 (=> (not res!270760) (not e!265767))))

(assert (=> b!454323 (= res!270760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205933 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454323 (= lt!205933 (array!28160 (store (arr!13523 _keys!709) i!563 k0!794) (size!13876 _keys!709)))))

(declare-fun b!454324 () Bool)

(declare-fun res!270766 () Bool)

(assert (=> b!454324 (=> (not res!270766) (not e!265768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454324 (= res!270766 (validKeyInArray!0 k0!794))))

(declare-fun res!270759 () Bool)

(assert (=> start!40894 (=> (not res!270759) (not e!265768))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40894 (= res!270759 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13876 _keys!709))))))

(assert (=> start!40894 e!265768))

(declare-fun tp_is_empty!12181 () Bool)

(assert (=> start!40894 tp_is_empty!12181))

(assert (=> start!40894 tp!38356))

(assert (=> start!40894 true))

(declare-datatypes ((V!17347 0))(
  ( (V!17348 (val!6135 Int)) )
))
(declare-datatypes ((ValueCell!5747 0))(
  ( (ValueCellFull!5747 (v!8395 V!17347)) (EmptyCell!5747) )
))
(declare-datatypes ((array!28161 0))(
  ( (array!28162 (arr!13524 (Array (_ BitVec 32) ValueCell!5747)) (size!13877 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28161)

(declare-fun e!265766 () Bool)

(declare-fun array_inv!9854 (array!28161) Bool)

(assert (=> start!40894 (and (array_inv!9854 _values!549) e!265766)))

(declare-fun array_inv!9855 (array!28159) Bool)

(assert (=> start!40894 (array_inv!9855 _keys!709)))

(declare-fun b!454325 () Bool)

(declare-fun res!270769 () Bool)

(assert (=> b!454325 (=> (not res!270769) (not e!265768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454325 (= res!270769 (validMask!0 mask!1025))))

(declare-fun b!454326 () Bool)

(declare-fun res!270764 () Bool)

(assert (=> b!454326 (=> (not res!270764) (not e!265768))))

(assert (=> b!454326 (= res!270764 (or (= (select (arr!13523 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13523 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19912 () Bool)

(declare-fun mapRes!19912 () Bool)

(declare-fun tp!38355 () Bool)

(declare-fun e!265769 () Bool)

(assert (=> mapNonEmpty!19912 (= mapRes!19912 (and tp!38355 e!265769))))

(declare-fun mapValue!19912 () ValueCell!5747)

(declare-fun mapKey!19912 () (_ BitVec 32))

(declare-fun mapRest!19912 () (Array (_ BitVec 32) ValueCell!5747))

(assert (=> mapNonEmpty!19912 (= (arr!13524 _values!549) (store mapRest!19912 mapKey!19912 mapValue!19912))))

(declare-fun b!454327 () Bool)

(assert (=> b!454327 (= e!265767 false)))

(declare-fun minValue!515 () V!17347)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!8092 0))(
  ( (tuple2!8093 (_1!4057 (_ BitVec 64)) (_2!4057 V!17347)) )
))
(declare-datatypes ((List!8154 0))(
  ( (Nil!8151) (Cons!8150 (h!9006 tuple2!8092) (t!13973 List!8154)) )
))
(declare-datatypes ((ListLongMap!6995 0))(
  ( (ListLongMap!6996 (toList!3513 List!8154)) )
))
(declare-fun lt!205932 () ListLongMap!6995)

(declare-fun zeroValue!515 () V!17347)

(declare-fun v!412 () V!17347)

(declare-fun getCurrentListMapNoExtraKeys!1708 (array!28159 array!28161 (_ BitVec 32) (_ BitVec 32) V!17347 V!17347 (_ BitVec 32) Int) ListLongMap!6995)

(assert (=> b!454327 (= lt!205932 (getCurrentListMapNoExtraKeys!1708 lt!205933 (array!28162 (store (arr!13524 _values!549) i!563 (ValueCellFull!5747 v!412)) (size!13877 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!205934 () ListLongMap!6995)

(assert (=> b!454327 (= lt!205934 (getCurrentListMapNoExtraKeys!1708 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454328 () Bool)

(declare-fun e!265771 () Bool)

(assert (=> b!454328 (= e!265766 (and e!265771 mapRes!19912))))

(declare-fun condMapEmpty!19912 () Bool)

(declare-fun mapDefault!19912 () ValueCell!5747)

(assert (=> b!454328 (= condMapEmpty!19912 (= (arr!13524 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5747)) mapDefault!19912)))))

(declare-fun b!454329 () Bool)

(declare-fun res!270765 () Bool)

(assert (=> b!454329 (=> (not res!270765) (not e!265768))))

(assert (=> b!454329 (= res!270765 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13876 _keys!709))))))

(declare-fun b!454330 () Bool)

(declare-fun res!270768 () Bool)

(assert (=> b!454330 (=> (not res!270768) (not e!265768))))

(declare-fun arrayContainsKey!0 (array!28159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454330 (= res!270768 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19912 () Bool)

(assert (=> mapIsEmpty!19912 mapRes!19912))

(declare-fun b!454331 () Bool)

(declare-fun res!270762 () Bool)

(assert (=> b!454331 (=> (not res!270762) (not e!265767))))

(assert (=> b!454331 (= res!270762 (bvsle from!863 i!563))))

(declare-fun b!454332 () Bool)

(declare-fun res!270770 () Bool)

(assert (=> b!454332 (=> (not res!270770) (not e!265768))))

(assert (=> b!454332 (= res!270770 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8150))))

(declare-fun b!454333 () Bool)

(assert (=> b!454333 (= e!265771 tp_is_empty!12181)))

(declare-fun b!454334 () Bool)

(declare-fun res!270761 () Bool)

(assert (=> b!454334 (=> (not res!270761) (not e!265768))))

(assert (=> b!454334 (= res!270761 (and (= (size!13877 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13876 _keys!709) (size!13877 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454335 () Bool)

(assert (=> b!454335 (= e!265769 tp_is_empty!12181)))

(assert (= (and start!40894 res!270759) b!454325))

(assert (= (and b!454325 res!270769) b!454334))

(assert (= (and b!454334 res!270761) b!454322))

(assert (= (and b!454322 res!270763) b!454332))

(assert (= (and b!454332 res!270770) b!454329))

(assert (= (and b!454329 res!270765) b!454324))

(assert (= (and b!454324 res!270766) b!454326))

(assert (= (and b!454326 res!270764) b!454330))

(assert (= (and b!454330 res!270768) b!454323))

(assert (= (and b!454323 res!270760) b!454321))

(assert (= (and b!454321 res!270767) b!454331))

(assert (= (and b!454331 res!270762) b!454327))

(assert (= (and b!454328 condMapEmpty!19912) mapIsEmpty!19912))

(assert (= (and b!454328 (not condMapEmpty!19912)) mapNonEmpty!19912))

(get-info :version)

(assert (= (and mapNonEmpty!19912 ((_ is ValueCellFull!5747) mapValue!19912)) b!454335))

(assert (= (and b!454328 ((_ is ValueCellFull!5747) mapDefault!19912)) b!454333))

(assert (= start!40894 b!454328))

(declare-fun m!437927 () Bool)

(assert (=> b!454323 m!437927))

(declare-fun m!437929 () Bool)

(assert (=> b!454323 m!437929))

(declare-fun m!437931 () Bool)

(assert (=> b!454327 m!437931))

(declare-fun m!437933 () Bool)

(assert (=> b!454327 m!437933))

(declare-fun m!437935 () Bool)

(assert (=> b!454327 m!437935))

(declare-fun m!437937 () Bool)

(assert (=> b!454324 m!437937))

(declare-fun m!437939 () Bool)

(assert (=> b!454326 m!437939))

(declare-fun m!437941 () Bool)

(assert (=> b!454322 m!437941))

(declare-fun m!437943 () Bool)

(assert (=> b!454330 m!437943))

(declare-fun m!437945 () Bool)

(assert (=> b!454332 m!437945))

(declare-fun m!437947 () Bool)

(assert (=> b!454325 m!437947))

(declare-fun m!437949 () Bool)

(assert (=> mapNonEmpty!19912 m!437949))

(declare-fun m!437951 () Bool)

(assert (=> start!40894 m!437951))

(declare-fun m!437953 () Bool)

(assert (=> start!40894 m!437953))

(declare-fun m!437955 () Bool)

(assert (=> b!454321 m!437955))

(check-sat (not b!454323) (not b!454327) b_and!18959 (not mapNonEmpty!19912) (not b!454324) (not b_next!10843) (not b!454325) tp_is_empty!12181 (not b!454322) (not b!454332) (not b!454330) (not start!40894) (not b!454321))
(check-sat b_and!18959 (not b_next!10843))
