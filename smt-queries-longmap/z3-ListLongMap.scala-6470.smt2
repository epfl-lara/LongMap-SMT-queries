; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82828 () Bool)

(assert start!82828)

(declare-fun b_free!18793 () Bool)

(declare-fun b_next!18793 () Bool)

(assert (=> start!82828 (= b_free!18793 (not b_next!18793))))

(declare-fun tp!65500 () Bool)

(declare-fun b_and!30291 () Bool)

(assert (=> start!82828 (= tp!65500 b_and!30291)))

(declare-fun mapIsEmpty!34387 () Bool)

(declare-fun mapRes!34387 () Bool)

(assert (=> mapIsEmpty!34387 mapRes!34387))

(declare-fun b!964560 () Bool)

(declare-fun e!543914 () Bool)

(declare-fun e!543913 () Bool)

(assert (=> b!964560 (= e!543914 (and e!543913 mapRes!34387))))

(declare-fun condMapEmpty!34387 () Bool)

(declare-datatypes ((V!33777 0))(
  ( (V!33778 (val!10848 Int)) )
))
(declare-datatypes ((ValueCell!10316 0))(
  ( (ValueCellFull!10316 (v!13403 V!33777)) (EmptyCell!10316) )
))
(declare-datatypes ((array!59302 0))(
  ( (array!59303 (arr!28515 (Array (_ BitVec 32) ValueCell!10316)) (size!28995 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59302)

(declare-fun mapDefault!34387 () ValueCell!10316)

(assert (=> b!964560 (= condMapEmpty!34387 (= (arr!28515 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10316)) mapDefault!34387)))))

(declare-fun b!964562 () Bool)

(declare-fun res!645298 () Bool)

(declare-fun e!543916 () Bool)

(assert (=> b!964562 (=> (not res!645298) (not e!543916))))

(declare-datatypes ((array!59304 0))(
  ( (array!59305 (arr!28516 (Array (_ BitVec 32) (_ BitVec 64))) (size!28996 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59304)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!964562 (= res!645298 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28996 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28996 _keys!1686))))))

(declare-fun b!964563 () Bool)

(declare-fun res!645303 () Bool)

(assert (=> b!964563 (=> (not res!645303) (not e!543916))))

(declare-datatypes ((List!19773 0))(
  ( (Nil!19770) (Cons!19769 (h!20937 (_ BitVec 64)) (t!28128 List!19773)) )
))
(declare-fun arrayNoDuplicates!0 (array!59304 (_ BitVec 32) List!19773) Bool)

(assert (=> b!964563 (= res!645303 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19770))))

(declare-fun b!964564 () Bool)

(declare-fun tp_is_empty!21595 () Bool)

(assert (=> b!964564 (= e!543913 tp_is_empty!21595)))

(declare-fun b!964565 () Bool)

(declare-fun res!645296 () Bool)

(assert (=> b!964565 (=> (not res!645296) (not e!543916))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!964565 (= res!645296 (and (= (size!28995 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28996 _keys!1686) (size!28995 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34387 () Bool)

(declare-fun tp!65499 () Bool)

(declare-fun e!543917 () Bool)

(assert (=> mapNonEmpty!34387 (= mapRes!34387 (and tp!65499 e!543917))))

(declare-fun mapKey!34387 () (_ BitVec 32))

(declare-fun mapValue!34387 () ValueCell!10316)

(declare-fun mapRest!34387 () (Array (_ BitVec 32) ValueCell!10316))

(assert (=> mapNonEmpty!34387 (= (arr!28515 _values!1400) (store mapRest!34387 mapKey!34387 mapValue!34387))))

(declare-fun b!964566 () Bool)

(declare-fun res!645301 () Bool)

(assert (=> b!964566 (=> (not res!645301) (not e!543916))))

(declare-fun minValue!1342 () V!33777)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33777)

(declare-datatypes ((tuple2!13926 0))(
  ( (tuple2!13927 (_1!6974 (_ BitVec 64)) (_2!6974 V!33777)) )
))
(declare-datatypes ((List!19774 0))(
  ( (Nil!19771) (Cons!19770 (h!20938 tuple2!13926) (t!28129 List!19774)) )
))
(declare-datatypes ((ListLongMap!12625 0))(
  ( (ListLongMap!12626 (toList!6328 List!19774)) )
))
(declare-fun contains!5443 (ListLongMap!12625 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3561 (array!59304 array!59302 (_ BitVec 32) (_ BitVec 32) V!33777 V!33777 (_ BitVec 32) Int) ListLongMap!12625)

(assert (=> b!964566 (= res!645301 (contains!5443 (getCurrentListMap!3561 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28516 _keys!1686) i!803)))))

(declare-fun b!964567 () Bool)

(assert (=> b!964567 (= e!543917 tp_is_empty!21595)))

(declare-fun b!964568 () Bool)

(declare-fun res!645297 () Bool)

(assert (=> b!964568 (=> (not res!645297) (not e!543916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59304 (_ BitVec 32)) Bool)

(assert (=> b!964568 (= res!645297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!645302 () Bool)

(assert (=> start!82828 (=> (not res!645302) (not e!543916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82828 (= res!645302 (validMask!0 mask!2110))))

(assert (=> start!82828 e!543916))

(assert (=> start!82828 true))

(declare-fun array_inv!22157 (array!59302) Bool)

(assert (=> start!82828 (and (array_inv!22157 _values!1400) e!543914)))

(declare-fun array_inv!22158 (array!59304) Bool)

(assert (=> start!82828 (array_inv!22158 _keys!1686)))

(assert (=> start!82828 tp!65500))

(assert (=> start!82828 tp_is_empty!21595))

(declare-fun b!964561 () Bool)

(declare-fun res!645299 () Bool)

(assert (=> b!964561 (=> (not res!645299) (not e!543916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964561 (= res!645299 (validKeyInArray!0 (select (arr!28516 _keys!1686) i!803)))))

(declare-fun b!964569 () Bool)

(assert (=> b!964569 (= e!543916 (not true))))

(assert (=> b!964569 (contains!5443 (getCurrentListMap!3561 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28516 _keys!1686) i!803))))

(declare-datatypes ((Unit!32212 0))(
  ( (Unit!32213) )
))
(declare-fun lt!431354 () Unit!32212)

(declare-fun lemmaInListMapFromThenInFromMinusOne!20 (array!59304 array!59302 (_ BitVec 32) (_ BitVec 32) V!33777 V!33777 (_ BitVec 32) (_ BitVec 32) Int) Unit!32212)

(assert (=> b!964569 (= lt!431354 (lemmaInListMapFromThenInFromMinusOne!20 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964570 () Bool)

(declare-fun res!645300 () Bool)

(assert (=> b!964570 (=> (not res!645300) (not e!543916))))

(assert (=> b!964570 (= res!645300 (bvsgt from!2084 newFrom!159))))

(assert (= (and start!82828 res!645302) b!964565))

(assert (= (and b!964565 res!645296) b!964568))

(assert (= (and b!964568 res!645297) b!964563))

(assert (= (and b!964563 res!645303) b!964562))

(assert (= (and b!964562 res!645298) b!964561))

(assert (= (and b!964561 res!645299) b!964566))

(assert (= (and b!964566 res!645301) b!964570))

(assert (= (and b!964570 res!645300) b!964569))

(assert (= (and b!964560 condMapEmpty!34387) mapIsEmpty!34387))

(assert (= (and b!964560 (not condMapEmpty!34387)) mapNonEmpty!34387))

(get-info :version)

(assert (= (and mapNonEmpty!34387 ((_ is ValueCellFull!10316) mapValue!34387)) b!964567))

(assert (= (and b!964560 ((_ is ValueCellFull!10316) mapDefault!34387)) b!964564))

(assert (= start!82828 b!964560))

(declare-fun m!894325 () Bool)

(assert (=> mapNonEmpty!34387 m!894325))

(declare-fun m!894327 () Bool)

(assert (=> b!964568 m!894327))

(declare-fun m!894329 () Bool)

(assert (=> b!964561 m!894329))

(assert (=> b!964561 m!894329))

(declare-fun m!894331 () Bool)

(assert (=> b!964561 m!894331))

(declare-fun m!894333 () Bool)

(assert (=> b!964563 m!894333))

(declare-fun m!894335 () Bool)

(assert (=> start!82828 m!894335))

(declare-fun m!894337 () Bool)

(assert (=> start!82828 m!894337))

(declare-fun m!894339 () Bool)

(assert (=> start!82828 m!894339))

(declare-fun m!894341 () Bool)

(assert (=> b!964569 m!894341))

(assert (=> b!964569 m!894329))

(assert (=> b!964569 m!894341))

(assert (=> b!964569 m!894329))

(declare-fun m!894343 () Bool)

(assert (=> b!964569 m!894343))

(declare-fun m!894345 () Bool)

(assert (=> b!964569 m!894345))

(declare-fun m!894347 () Bool)

(assert (=> b!964566 m!894347))

(assert (=> b!964566 m!894329))

(assert (=> b!964566 m!894347))

(assert (=> b!964566 m!894329))

(declare-fun m!894349 () Bool)

(assert (=> b!964566 m!894349))

(check-sat (not b_next!18793) (not b!964569) (not b!964566) (not start!82828) (not mapNonEmpty!34387) tp_is_empty!21595 (not b!964563) (not b!964568) b_and!30291 (not b!964561))
(check-sat b_and!30291 (not b_next!18793))
