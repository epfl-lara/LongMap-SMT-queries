; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83226 () Bool)

(assert start!83226)

(declare-fun b!969869 () Bool)

(declare-fun e!546765 () Bool)

(declare-fun e!546763 () Bool)

(declare-fun mapRes!34933 () Bool)

(assert (=> b!969869 (= e!546765 (and e!546763 mapRes!34933))))

(declare-fun condMapEmpty!34933 () Bool)

(declare-datatypes ((V!34249 0))(
  ( (V!34250 (val!11025 Int)) )
))
(declare-datatypes ((ValueCell!10493 0))(
  ( (ValueCellFull!10493 (v!13581 V!34249)) (EmptyCell!10493) )
))
(declare-datatypes ((array!59986 0))(
  ( (array!59987 (arr!28852 (Array (_ BitVec 32) ValueCell!10493)) (size!29332 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59986)

(declare-fun mapDefault!34933 () ValueCell!10493)

(assert (=> b!969869 (= condMapEmpty!34933 (= (arr!28852 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10493)) mapDefault!34933)))))

(declare-fun res!648950 () Bool)

(declare-fun e!546766 () Bool)

(assert (=> start!83226 (=> (not res!648950) (not e!546766))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83226 (= res!648950 (validMask!0 mask!2147))))

(assert (=> start!83226 e!546766))

(assert (=> start!83226 true))

(declare-fun array_inv!22393 (array!59986) Bool)

(assert (=> start!83226 (and (array_inv!22393 _values!1425) e!546765)))

(declare-datatypes ((array!59988 0))(
  ( (array!59989 (arr!28853 (Array (_ BitVec 32) (_ BitVec 64))) (size!29333 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59988)

(declare-fun array_inv!22394 (array!59988) Bool)

(assert (=> start!83226 (array_inv!22394 _keys!1717)))

(declare-fun mapIsEmpty!34933 () Bool)

(assert (=> mapIsEmpty!34933 mapRes!34933))

(declare-fun b!969870 () Bool)

(declare-fun e!546764 () Bool)

(declare-fun tp_is_empty!21949 () Bool)

(assert (=> b!969870 (= e!546764 tp_is_empty!21949)))

(declare-fun b!969871 () Bool)

(assert (=> b!969871 (= e!546766 false)))

(declare-fun lt!431934 () Bool)

(declare-datatypes ((List!20000 0))(
  ( (Nil!19997) (Cons!19996 (h!21164 (_ BitVec 64)) (t!28355 List!20000)) )
))
(declare-fun arrayNoDuplicates!0 (array!59988 (_ BitVec 32) List!20000) Bool)

(assert (=> b!969871 (= lt!431934 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!19997))))

(declare-fun mapNonEmpty!34933 () Bool)

(declare-fun tp!66502 () Bool)

(assert (=> mapNonEmpty!34933 (= mapRes!34933 (and tp!66502 e!546764))))

(declare-fun mapRest!34933 () (Array (_ BitVec 32) ValueCell!10493))

(declare-fun mapKey!34933 () (_ BitVec 32))

(declare-fun mapValue!34933 () ValueCell!10493)

(assert (=> mapNonEmpty!34933 (= (arr!28852 _values!1425) (store mapRest!34933 mapKey!34933 mapValue!34933))))

(declare-fun b!969872 () Bool)

(declare-fun res!648949 () Bool)

(assert (=> b!969872 (=> (not res!648949) (not e!546766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59988 (_ BitVec 32)) Bool)

(assert (=> b!969872 (= res!648949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969873 () Bool)

(declare-fun res!648948 () Bool)

(assert (=> b!969873 (=> (not res!648948) (not e!546766))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969873 (= res!648948 (and (= (size!29332 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29333 _keys!1717) (size!29332 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969874 () Bool)

(assert (=> b!969874 (= e!546763 tp_is_empty!21949)))

(assert (= (and start!83226 res!648950) b!969873))

(assert (= (and b!969873 res!648948) b!969872))

(assert (= (and b!969872 res!648949) b!969871))

(assert (= (and b!969869 condMapEmpty!34933) mapIsEmpty!34933))

(assert (= (and b!969869 (not condMapEmpty!34933)) mapNonEmpty!34933))

(get-info :version)

(assert (= (and mapNonEmpty!34933 ((_ is ValueCellFull!10493) mapValue!34933)) b!969870))

(assert (= (and b!969869 ((_ is ValueCellFull!10493) mapDefault!34933)) b!969874))

(assert (= start!83226 b!969869))

(declare-fun m!898421 () Bool)

(assert (=> start!83226 m!898421))

(declare-fun m!898423 () Bool)

(assert (=> start!83226 m!898423))

(declare-fun m!898425 () Bool)

(assert (=> start!83226 m!898425))

(declare-fun m!898427 () Bool)

(assert (=> b!969871 m!898427))

(declare-fun m!898429 () Bool)

(assert (=> mapNonEmpty!34933 m!898429))

(declare-fun m!898431 () Bool)

(assert (=> b!969872 m!898431))

(check-sat (not start!83226) (not b!969871) tp_is_empty!21949 (not b!969872) (not mapNonEmpty!34933))
(check-sat)
