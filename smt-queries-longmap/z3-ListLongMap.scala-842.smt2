; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20152 () Bool)

(assert start!20152)

(declare-fun b_free!4807 () Bool)

(declare-fun b_next!4807 () Bool)

(assert (=> start!20152 (= b_free!4807 (not b_next!4807))))

(declare-fun tp!17452 () Bool)

(declare-fun b_and!11527 () Bool)

(assert (=> start!20152 (= tp!17452 b_and!11527)))

(declare-fun b!197507 () Bool)

(declare-fun e!129932 () Bool)

(declare-fun tp_is_empty!4663 () Bool)

(assert (=> b!197507 (= e!129932 tp_is_empty!4663)))

(declare-fun b!197508 () Bool)

(declare-fun res!93443 () Bool)

(declare-fun e!129931 () Bool)

(assert (=> b!197508 (=> (not res!93443) (not e!129931))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8555 0))(
  ( (array!8556 (arr!4027 (Array (_ BitVec 32) (_ BitVec 64))) (size!4353 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8555)

(assert (=> b!197508 (= res!93443 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4353 _keys!825))))))

(declare-fun b!197509 () Bool)

(assert (=> b!197509 (= e!129931 false)))

(declare-datatypes ((V!5865 0))(
  ( (V!5866 (val!2376 Int)) )
))
(declare-datatypes ((ValueCell!1988 0))(
  ( (ValueCellFull!1988 (v!4340 V!5865)) (EmptyCell!1988) )
))
(declare-datatypes ((array!8557 0))(
  ( (array!8558 (arr!4028 (Array (_ BitVec 32) ValueCell!1988)) (size!4354 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8557)

(declare-datatypes ((tuple2!3574 0))(
  ( (tuple2!3575 (_1!1798 (_ BitVec 64)) (_2!1798 V!5865)) )
))
(declare-datatypes ((List!2505 0))(
  ( (Nil!2502) (Cons!2501 (h!3143 tuple2!3574) (t!7427 List!2505)) )
))
(declare-datatypes ((ListLongMap!2477 0))(
  ( (ListLongMap!2478 (toList!1254 List!2505)) )
))
(declare-fun lt!97579 () ListLongMap!2477)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!5865)

(declare-fun zeroValue!615 () V!5865)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5865)

(declare-fun getCurrentListMapNoExtraKeys!234 (array!8555 array!8557 (_ BitVec 32) (_ BitVec 32) V!5865 V!5865 (_ BitVec 32) Int) ListLongMap!2477)

(assert (=> b!197509 (= lt!97579 (getCurrentListMapNoExtraKeys!234 _keys!825 (array!8558 (store (arr!4028 _values!649) i!601 (ValueCellFull!1988 v!520)) (size!4354 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97580 () ListLongMap!2477)

(assert (=> b!197509 (= lt!97580 (getCurrentListMapNoExtraKeys!234 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!93445 () Bool)

(assert (=> start!20152 (=> (not res!93445) (not e!129931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20152 (= res!93445 (validMask!0 mask!1149))))

(assert (=> start!20152 e!129931))

(declare-fun e!129933 () Bool)

(declare-fun array_inv!2623 (array!8557) Bool)

(assert (=> start!20152 (and (array_inv!2623 _values!649) e!129933)))

(assert (=> start!20152 true))

(assert (=> start!20152 tp_is_empty!4663))

(declare-fun array_inv!2624 (array!8555) Bool)

(assert (=> start!20152 (array_inv!2624 _keys!825)))

(assert (=> start!20152 tp!17452))

(declare-fun mapNonEmpty!8063 () Bool)

(declare-fun mapRes!8063 () Bool)

(declare-fun tp!17453 () Bool)

(declare-fun e!129929 () Bool)

(assert (=> mapNonEmpty!8063 (= mapRes!8063 (and tp!17453 e!129929))))

(declare-fun mapKey!8063 () (_ BitVec 32))

(declare-fun mapValue!8063 () ValueCell!1988)

(declare-fun mapRest!8063 () (Array (_ BitVec 32) ValueCell!1988))

(assert (=> mapNonEmpty!8063 (= (arr!4028 _values!649) (store mapRest!8063 mapKey!8063 mapValue!8063))))

(declare-fun b!197510 () Bool)

(declare-fun res!93447 () Bool)

(assert (=> b!197510 (=> (not res!93447) (not e!129931))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197510 (= res!93447 (validKeyInArray!0 k0!843))))

(declare-fun b!197511 () Bool)

(declare-fun res!93449 () Bool)

(assert (=> b!197511 (=> (not res!93449) (not e!129931))))

(assert (=> b!197511 (= res!93449 (and (= (size!4354 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4353 _keys!825) (size!4354 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197512 () Bool)

(assert (=> b!197512 (= e!129929 tp_is_empty!4663)))

(declare-fun mapIsEmpty!8063 () Bool)

(assert (=> mapIsEmpty!8063 mapRes!8063))

(declare-fun b!197513 () Bool)

(declare-fun res!93448 () Bool)

(assert (=> b!197513 (=> (not res!93448) (not e!129931))))

(declare-datatypes ((List!2506 0))(
  ( (Nil!2503) (Cons!2502 (h!3144 (_ BitVec 64)) (t!7428 List!2506)) )
))
(declare-fun arrayNoDuplicates!0 (array!8555 (_ BitVec 32) List!2506) Bool)

(assert (=> b!197513 (= res!93448 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2503))))

(declare-fun b!197514 () Bool)

(assert (=> b!197514 (= e!129933 (and e!129932 mapRes!8063))))

(declare-fun condMapEmpty!8063 () Bool)

(declare-fun mapDefault!8063 () ValueCell!1988)

(assert (=> b!197514 (= condMapEmpty!8063 (= (arr!4028 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1988)) mapDefault!8063)))))

(declare-fun b!197515 () Bool)

(declare-fun res!93444 () Bool)

(assert (=> b!197515 (=> (not res!93444) (not e!129931))))

(assert (=> b!197515 (= res!93444 (= (select (arr!4027 _keys!825) i!601) k0!843))))

(declare-fun b!197516 () Bool)

(declare-fun res!93446 () Bool)

(assert (=> b!197516 (=> (not res!93446) (not e!129931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8555 (_ BitVec 32)) Bool)

(assert (=> b!197516 (= res!93446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20152 res!93445) b!197511))

(assert (= (and b!197511 res!93449) b!197516))

(assert (= (and b!197516 res!93446) b!197513))

(assert (= (and b!197513 res!93448) b!197508))

(assert (= (and b!197508 res!93443) b!197510))

(assert (= (and b!197510 res!93447) b!197515))

(assert (= (and b!197515 res!93444) b!197509))

(assert (= (and b!197514 condMapEmpty!8063) mapIsEmpty!8063))

(assert (= (and b!197514 (not condMapEmpty!8063)) mapNonEmpty!8063))

(get-info :version)

(assert (= (and mapNonEmpty!8063 ((_ is ValueCellFull!1988) mapValue!8063)) b!197512))

(assert (= (and b!197514 ((_ is ValueCellFull!1988) mapDefault!8063)) b!197507))

(assert (= start!20152 b!197514))

(declare-fun m!223857 () Bool)

(assert (=> b!197516 m!223857))

(declare-fun m!223859 () Bool)

(assert (=> b!197509 m!223859))

(declare-fun m!223861 () Bool)

(assert (=> b!197509 m!223861))

(declare-fun m!223863 () Bool)

(assert (=> b!197509 m!223863))

(declare-fun m!223865 () Bool)

(assert (=> b!197510 m!223865))

(declare-fun m!223867 () Bool)

(assert (=> mapNonEmpty!8063 m!223867))

(declare-fun m!223869 () Bool)

(assert (=> start!20152 m!223869))

(declare-fun m!223871 () Bool)

(assert (=> start!20152 m!223871))

(declare-fun m!223873 () Bool)

(assert (=> start!20152 m!223873))

(declare-fun m!223875 () Bool)

(assert (=> b!197513 m!223875))

(declare-fun m!223877 () Bool)

(assert (=> b!197515 m!223877))

(check-sat (not b_next!4807) (not b!197509) (not start!20152) (not b!197510) (not b!197513) (not mapNonEmpty!8063) b_and!11527 (not b!197516) tp_is_empty!4663)
(check-sat b_and!11527 (not b_next!4807))
