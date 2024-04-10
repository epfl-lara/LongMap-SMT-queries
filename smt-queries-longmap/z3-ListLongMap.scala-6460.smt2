; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82602 () Bool)

(assert start!82602)

(declare-fun b_free!18735 () Bool)

(declare-fun b_next!18735 () Bool)

(assert (=> start!82602 (= b_free!18735 (not b_next!18735))))

(declare-fun tp!65324 () Bool)

(declare-fun b_and!30223 () Bool)

(assert (=> start!82602 (= tp!65324 b_and!30223)))

(declare-fun res!644266 () Bool)

(declare-fun e!542899 () Bool)

(assert (=> start!82602 (=> (not res!644266) (not e!542899))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82602 (= res!644266 (validMask!0 mask!2110))))

(assert (=> start!82602 e!542899))

(assert (=> start!82602 true))

(declare-datatypes ((V!33699 0))(
  ( (V!33700 (val!10819 Int)) )
))
(declare-datatypes ((ValueCell!10287 0))(
  ( (ValueCellFull!10287 (v!13377 V!33699)) (EmptyCell!10287) )
))
(declare-datatypes ((array!59169 0))(
  ( (array!59170 (arr!28453 (Array (_ BitVec 32) ValueCell!10287)) (size!28932 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59169)

(declare-fun e!542900 () Bool)

(declare-fun array_inv!22045 (array!59169) Bool)

(assert (=> start!82602 (and (array_inv!22045 _values!1400) e!542900)))

(declare-datatypes ((array!59171 0))(
  ( (array!59172 (arr!28454 (Array (_ BitVec 32) (_ BitVec 64))) (size!28933 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59171)

(declare-fun array_inv!22046 (array!59171) Bool)

(assert (=> start!82602 (array_inv!22046 _keys!1686)))

(assert (=> start!82602 tp!65324))

(declare-fun tp_is_empty!21537 () Bool)

(assert (=> start!82602 tp_is_empty!21537))

(declare-fun b!962708 () Bool)

(declare-fun e!542897 () Bool)

(assert (=> b!962708 (= e!542897 tp_is_empty!21537)))

(declare-fun b!962709 () Bool)

(declare-fun res!644269 () Bool)

(assert (=> b!962709 (=> (not res!644269) (not e!542899))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962709 (= res!644269 (validKeyInArray!0 (select (arr!28454 _keys!1686) i!803)))))

(declare-fun b!962710 () Bool)

(declare-fun res!644268 () Bool)

(assert (=> b!962710 (=> (not res!644268) (not e!542899))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(assert (=> b!962710 (= res!644268 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28933 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28933 _keys!1686))))))

(declare-fun mapNonEmpty!34300 () Bool)

(declare-fun mapRes!34300 () Bool)

(declare-fun tp!65325 () Bool)

(declare-fun e!542896 () Bool)

(assert (=> mapNonEmpty!34300 (= mapRes!34300 (and tp!65325 e!542896))))

(declare-fun mapValue!34300 () ValueCell!10287)

(declare-fun mapRest!34300 () (Array (_ BitVec 32) ValueCell!10287))

(declare-fun mapKey!34300 () (_ BitVec 32))

(assert (=> mapNonEmpty!34300 (= (arr!28453 _values!1400) (store mapRest!34300 mapKey!34300 mapValue!34300))))

(declare-fun b!962711 () Bool)

(assert (=> b!962711 (= e!542900 (and e!542897 mapRes!34300))))

(declare-fun condMapEmpty!34300 () Bool)

(declare-fun mapDefault!34300 () ValueCell!10287)

(assert (=> b!962711 (= condMapEmpty!34300 (= (arr!28453 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10287)) mapDefault!34300)))))

(declare-fun b!962712 () Bool)

(declare-fun res!644265 () Bool)

(assert (=> b!962712 (=> (not res!644265) (not e!542899))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!962712 (= res!644265 (and (= (size!28932 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28933 _keys!1686) (size!28932 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962713 () Bool)

(declare-fun res!644264 () Bool)

(assert (=> b!962713 (=> (not res!644264) (not e!542899))))

(declare-datatypes ((List!19746 0))(
  ( (Nil!19743) (Cons!19742 (h!20904 (_ BitVec 64)) (t!28109 List!19746)) )
))
(declare-fun arrayNoDuplicates!0 (array!59171 (_ BitVec 32) List!19746) Bool)

(assert (=> b!962713 (= res!644264 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19743))))

(declare-fun b!962714 () Bool)

(assert (=> b!962714 (= e!542896 tp_is_empty!21537)))

(declare-fun b!962715 () Bool)

(declare-fun res!644267 () Bool)

(assert (=> b!962715 (=> (not res!644267) (not e!542899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59171 (_ BitVec 32)) Bool)

(assert (=> b!962715 (= res!644267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962716 () Bool)

(assert (=> b!962716 (= e!542899 false)))

(declare-fun minValue!1342 () V!33699)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33699)

(declare-fun lt!430906 () Bool)

(declare-datatypes ((tuple2!13896 0))(
  ( (tuple2!13897 (_1!6959 (_ BitVec 64)) (_2!6959 V!33699)) )
))
(declare-datatypes ((List!19747 0))(
  ( (Nil!19744) (Cons!19743 (h!20905 tuple2!13896) (t!28110 List!19747)) )
))
(declare-datatypes ((ListLongMap!12593 0))(
  ( (ListLongMap!12594 (toList!6312 List!19747)) )
))
(declare-fun contains!5415 (ListLongMap!12593 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3545 (array!59171 array!59169 (_ BitVec 32) (_ BitVec 32) V!33699 V!33699 (_ BitVec 32) Int) ListLongMap!12593)

(assert (=> b!962716 (= lt!430906 (contains!5415 (getCurrentListMap!3545 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28454 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34300 () Bool)

(assert (=> mapIsEmpty!34300 mapRes!34300))

(assert (= (and start!82602 res!644266) b!962712))

(assert (= (and b!962712 res!644265) b!962715))

(assert (= (and b!962715 res!644267) b!962713))

(assert (= (and b!962713 res!644264) b!962710))

(assert (= (and b!962710 res!644268) b!962709))

(assert (= (and b!962709 res!644269) b!962716))

(assert (= (and b!962711 condMapEmpty!34300) mapIsEmpty!34300))

(assert (= (and b!962711 (not condMapEmpty!34300)) mapNonEmpty!34300))

(get-info :version)

(assert (= (and mapNonEmpty!34300 ((_ is ValueCellFull!10287) mapValue!34300)) b!962714))

(assert (= (and b!962711 ((_ is ValueCellFull!10287) mapDefault!34300)) b!962708))

(assert (= start!82602 b!962711))

(declare-fun m!892289 () Bool)

(assert (=> b!962716 m!892289))

(declare-fun m!892291 () Bool)

(assert (=> b!962716 m!892291))

(assert (=> b!962716 m!892289))

(assert (=> b!962716 m!892291))

(declare-fun m!892293 () Bool)

(assert (=> b!962716 m!892293))

(assert (=> b!962709 m!892291))

(assert (=> b!962709 m!892291))

(declare-fun m!892295 () Bool)

(assert (=> b!962709 m!892295))

(declare-fun m!892297 () Bool)

(assert (=> b!962713 m!892297))

(declare-fun m!892299 () Bool)

(assert (=> mapNonEmpty!34300 m!892299))

(declare-fun m!892301 () Bool)

(assert (=> b!962715 m!892301))

(declare-fun m!892303 () Bool)

(assert (=> start!82602 m!892303))

(declare-fun m!892305 () Bool)

(assert (=> start!82602 m!892305))

(declare-fun m!892307 () Bool)

(assert (=> start!82602 m!892307))

(check-sat (not start!82602) tp_is_empty!21537 (not b!962713) (not b!962709) b_and!30223 (not b_next!18735) (not mapNonEmpty!34300) (not b!962716) (not b!962715))
(check-sat b_and!30223 (not b_next!18735))
