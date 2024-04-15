; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83196 () Bool)

(assert start!83196)

(declare-fun b_free!19207 () Bool)

(declare-fun b_next!19207 () Bool)

(assert (=> start!83196 (= b_free!19207 (not b_next!19207))))

(declare-fun tp!66901 () Bool)

(declare-fun b_and!30669 () Bool)

(assert (=> start!83196 (= tp!66901 b_and!30669)))

(declare-fun b!970670 () Bool)

(declare-fun res!649741 () Bool)

(declare-fun e!547204 () Bool)

(assert (=> b!970670 (=> (not res!649741) (not e!547204))))

(declare-datatypes ((array!60196 0))(
  ( (array!60197 (arr!28962 (Array (_ BitVec 32) (_ BitVec 64))) (size!29443 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60196)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!970670 (= res!649741 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29443 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29443 _keys!1717))))))

(declare-fun res!649736 () Bool)

(assert (=> start!83196 (=> (not res!649736) (not e!547204))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83196 (= res!649736 (validMask!0 mask!2147))))

(assert (=> start!83196 e!547204))

(assert (=> start!83196 true))

(declare-datatypes ((V!34457 0))(
  ( (V!34458 (val!11103 Int)) )
))
(declare-datatypes ((ValueCell!10571 0))(
  ( (ValueCellFull!10571 (v!13661 V!34457)) (EmptyCell!10571) )
))
(declare-datatypes ((array!60198 0))(
  ( (array!60199 (arr!28963 (Array (_ BitVec 32) ValueCell!10571)) (size!29444 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60198)

(declare-fun e!547205 () Bool)

(declare-fun array_inv!22477 (array!60198) Bool)

(assert (=> start!83196 (and (array_inv!22477 _values!1425) e!547205)))

(declare-fun tp_is_empty!22105 () Bool)

(assert (=> start!83196 tp_is_empty!22105))

(assert (=> start!83196 tp!66901))

(declare-fun array_inv!22478 (array!60196) Bool)

(assert (=> start!83196 (array_inv!22478 _keys!1717)))

(declare-fun mapNonEmpty!35167 () Bool)

(declare-fun mapRes!35167 () Bool)

(declare-fun tp!66900 () Bool)

(declare-fun e!547206 () Bool)

(assert (=> mapNonEmpty!35167 (= mapRes!35167 (and tp!66900 e!547206))))

(declare-fun mapValue!35167 () ValueCell!10571)

(declare-fun mapKey!35167 () (_ BitVec 32))

(declare-fun mapRest!35167 () (Array (_ BitVec 32) ValueCell!10571))

(assert (=> mapNonEmpty!35167 (= (arr!28963 _values!1425) (store mapRest!35167 mapKey!35167 mapValue!35167))))

(declare-fun b!970671 () Bool)

(declare-fun e!547202 () Bool)

(assert (=> b!970671 (= e!547202 tp_is_empty!22105)))

(declare-fun b!970672 () Bool)

(assert (=> b!970672 (= e!547204 false)))

(declare-datatypes ((tuple2!14310 0))(
  ( (tuple2!14311 (_1!7166 (_ BitVec 64)) (_2!7166 V!34457)) )
))
(declare-datatypes ((List!20130 0))(
  ( (Nil!20127) (Cons!20126 (h!21288 tuple2!14310) (t!28484 List!20130)) )
))
(declare-datatypes ((ListLongMap!12997 0))(
  ( (ListLongMap!12998 (toList!6514 List!20130)) )
))
(declare-fun lt!431544 () ListLongMap!12997)

(declare-fun zeroValue!1367 () V!34457)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34457)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3676 (array!60196 array!60198 (_ BitVec 32) (_ BitVec 32) V!34457 V!34457 (_ BitVec 32) Int) ListLongMap!12997)

(assert (=> b!970672 (= lt!431544 (getCurrentListMap!3676 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!970673 () Bool)

(declare-fun res!649737 () Bool)

(assert (=> b!970673 (=> (not res!649737) (not e!547204))))

(declare-datatypes ((List!20131 0))(
  ( (Nil!20128) (Cons!20127 (h!21289 (_ BitVec 64)) (t!28485 List!20131)) )
))
(declare-fun arrayNoDuplicates!0 (array!60196 (_ BitVec 32) List!20131) Bool)

(assert (=> b!970673 (= res!649737 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20128))))

(declare-fun b!970674 () Bool)

(declare-fun res!649738 () Bool)

(assert (=> b!970674 (=> (not res!649738) (not e!547204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60196 (_ BitVec 32)) Bool)

(assert (=> b!970674 (= res!649738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970675 () Bool)

(declare-fun res!649740 () Bool)

(assert (=> b!970675 (=> (not res!649740) (not e!547204))))

(assert (=> b!970675 (= res!649740 (and (= (size!29444 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29443 _keys!1717) (size!29444 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970676 () Bool)

(declare-fun res!649735 () Bool)

(assert (=> b!970676 (=> (not res!649735) (not e!547204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970676 (= res!649735 (validKeyInArray!0 (select (arr!28962 _keys!1717) i!822)))))

(declare-fun b!970677 () Bool)

(assert (=> b!970677 (= e!547205 (and e!547202 mapRes!35167))))

(declare-fun condMapEmpty!35167 () Bool)

(declare-fun mapDefault!35167 () ValueCell!10571)

(assert (=> b!970677 (= condMapEmpty!35167 (= (arr!28963 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10571)) mapDefault!35167)))))

(declare-fun mapIsEmpty!35167 () Bool)

(assert (=> mapIsEmpty!35167 mapRes!35167))

(declare-fun b!970678 () Bool)

(declare-fun res!649739 () Bool)

(assert (=> b!970678 (=> (not res!649739) (not e!547204))))

(declare-fun contains!5562 (ListLongMap!12997 (_ BitVec 64)) Bool)

(assert (=> b!970678 (= res!649739 (contains!5562 (getCurrentListMap!3676 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28962 _keys!1717) i!822)))))

(declare-fun b!970679 () Bool)

(assert (=> b!970679 (= e!547206 tp_is_empty!22105)))

(assert (= (and start!83196 res!649736) b!970675))

(assert (= (and b!970675 res!649740) b!970674))

(assert (= (and b!970674 res!649738) b!970673))

(assert (= (and b!970673 res!649737) b!970670))

(assert (= (and b!970670 res!649741) b!970676))

(assert (= (and b!970676 res!649735) b!970678))

(assert (= (and b!970678 res!649739) b!970672))

(assert (= (and b!970677 condMapEmpty!35167) mapIsEmpty!35167))

(assert (= (and b!970677 (not condMapEmpty!35167)) mapNonEmpty!35167))

(get-info :version)

(assert (= (and mapNonEmpty!35167 ((_ is ValueCellFull!10571) mapValue!35167)) b!970679))

(assert (= (and b!970677 ((_ is ValueCellFull!10571) mapDefault!35167)) b!970671))

(assert (= start!83196 b!970677))

(declare-fun m!897749 () Bool)

(assert (=> b!970674 m!897749))

(declare-fun m!897751 () Bool)

(assert (=> b!970673 m!897751))

(declare-fun m!897753 () Bool)

(assert (=> b!970676 m!897753))

(assert (=> b!970676 m!897753))

(declare-fun m!897755 () Bool)

(assert (=> b!970676 m!897755))

(declare-fun m!897757 () Bool)

(assert (=> mapNonEmpty!35167 m!897757))

(declare-fun m!897759 () Bool)

(assert (=> b!970678 m!897759))

(assert (=> b!970678 m!897753))

(assert (=> b!970678 m!897759))

(assert (=> b!970678 m!897753))

(declare-fun m!897761 () Bool)

(assert (=> b!970678 m!897761))

(declare-fun m!897763 () Bool)

(assert (=> start!83196 m!897763))

(declare-fun m!897765 () Bool)

(assert (=> start!83196 m!897765))

(declare-fun m!897767 () Bool)

(assert (=> start!83196 m!897767))

(declare-fun m!897769 () Bool)

(assert (=> b!970672 m!897769))

(check-sat (not start!83196) b_and!30669 (not b!970674) (not mapNonEmpty!35167) (not b!970676) (not b!970678) (not b!970673) tp_is_empty!22105 (not b!970672) (not b_next!19207))
(check-sat b_and!30669 (not b_next!19207))
