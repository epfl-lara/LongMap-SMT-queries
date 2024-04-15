; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38756 () Bool)

(assert start!38756)

(declare-fun b!403936 () Bool)

(declare-fun e!243033 () Bool)

(declare-fun tp_is_empty!10189 () Bool)

(assert (=> b!403936 (= e!243033 tp_is_empty!10189)))

(declare-fun b!403937 () Bool)

(declare-fun res!232933 () Bool)

(declare-fun e!243034 () Bool)

(assert (=> b!403937 (=> (not res!232933) (not e!243034))))

(declare-datatypes ((array!24259 0))(
  ( (array!24260 (arr!11579 (Array (_ BitVec 32) (_ BitVec 64))) (size!11932 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24259)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24259 (_ BitVec 32)) Bool)

(assert (=> b!403937 (= res!232933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403938 () Bool)

(declare-fun res!232930 () Bool)

(assert (=> b!403938 (=> (not res!232930) (not e!243034))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14691 0))(
  ( (V!14692 (val!5139 Int)) )
))
(declare-datatypes ((ValueCell!4751 0))(
  ( (ValueCellFull!4751 (v!7380 V!14691)) (EmptyCell!4751) )
))
(declare-datatypes ((array!24261 0))(
  ( (array!24262 (arr!11580 (Array (_ BitVec 32) ValueCell!4751)) (size!11933 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24261)

(assert (=> b!403938 (= res!232930 (and (= (size!11933 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11932 _keys!709) (size!11933 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403939 () Bool)

(declare-fun e!243031 () Bool)

(assert (=> b!403939 (= e!243031 false)))

(declare-fun lt!187913 () Bool)

(declare-fun lt!187912 () array!24259)

(declare-datatypes ((List!6722 0))(
  ( (Nil!6719) (Cons!6718 (h!7574 (_ BitVec 64)) (t!11887 List!6722)) )
))
(declare-fun arrayNoDuplicates!0 (array!24259 (_ BitVec 32) List!6722) Bool)

(assert (=> b!403939 (= lt!187913 (arrayNoDuplicates!0 lt!187912 #b00000000000000000000000000000000 Nil!6719))))

(declare-fun b!403941 () Bool)

(declare-fun e!243035 () Bool)

(assert (=> b!403941 (= e!243035 tp_is_empty!10189)))

(declare-fun b!403942 () Bool)

(declare-fun res!232934 () Bool)

(assert (=> b!403942 (=> (not res!232934) (not e!243034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403942 (= res!232934 (validMask!0 mask!1025))))

(declare-fun b!403943 () Bool)

(declare-fun res!232937 () Bool)

(assert (=> b!403943 (=> (not res!232937) (not e!243034))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403943 (= res!232937 (or (= (select (arr!11579 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11579 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16905 () Bool)

(declare-fun mapRes!16905 () Bool)

(declare-fun tp!33024 () Bool)

(assert (=> mapNonEmpty!16905 (= mapRes!16905 (and tp!33024 e!243035))))

(declare-fun mapKey!16905 () (_ BitVec 32))

(declare-fun mapValue!16905 () ValueCell!4751)

(declare-fun mapRest!16905 () (Array (_ BitVec 32) ValueCell!4751))

(assert (=> mapNonEmpty!16905 (= (arr!11580 _values!549) (store mapRest!16905 mapKey!16905 mapValue!16905))))

(declare-fun b!403944 () Bool)

(assert (=> b!403944 (= e!243034 e!243031)))

(declare-fun res!232938 () Bool)

(assert (=> b!403944 (=> (not res!232938) (not e!243031))))

(assert (=> b!403944 (= res!232938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187912 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!403944 (= lt!187912 (array!24260 (store (arr!11579 _keys!709) i!563 k0!794) (size!11932 _keys!709)))))

(declare-fun b!403945 () Bool)

(declare-fun res!232935 () Bool)

(assert (=> b!403945 (=> (not res!232935) (not e!243034))))

(assert (=> b!403945 (= res!232935 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11932 _keys!709))))))

(declare-fun b!403946 () Bool)

(declare-fun res!232929 () Bool)

(assert (=> b!403946 (=> (not res!232929) (not e!243034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403946 (= res!232929 (validKeyInArray!0 k0!794))))

(declare-fun b!403947 () Bool)

(declare-fun e!243032 () Bool)

(assert (=> b!403947 (= e!243032 (and e!243033 mapRes!16905))))

(declare-fun condMapEmpty!16905 () Bool)

(declare-fun mapDefault!16905 () ValueCell!4751)

(assert (=> b!403947 (= condMapEmpty!16905 (= (arr!11580 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4751)) mapDefault!16905)))))

(declare-fun b!403940 () Bool)

(declare-fun res!232936 () Bool)

(assert (=> b!403940 (=> (not res!232936) (not e!243034))))

(assert (=> b!403940 (= res!232936 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6719))))

(declare-fun res!232932 () Bool)

(assert (=> start!38756 (=> (not res!232932) (not e!243034))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38756 (= res!232932 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11932 _keys!709))))))

(assert (=> start!38756 e!243034))

(assert (=> start!38756 true))

(declare-fun array_inv!8498 (array!24261) Bool)

(assert (=> start!38756 (and (array_inv!8498 _values!549) e!243032)))

(declare-fun array_inv!8499 (array!24259) Bool)

(assert (=> start!38756 (array_inv!8499 _keys!709)))

(declare-fun mapIsEmpty!16905 () Bool)

(assert (=> mapIsEmpty!16905 mapRes!16905))

(declare-fun b!403948 () Bool)

(declare-fun res!232931 () Bool)

(assert (=> b!403948 (=> (not res!232931) (not e!243034))))

(declare-fun arrayContainsKey!0 (array!24259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403948 (= res!232931 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!38756 res!232932) b!403942))

(assert (= (and b!403942 res!232934) b!403938))

(assert (= (and b!403938 res!232930) b!403937))

(assert (= (and b!403937 res!232933) b!403940))

(assert (= (and b!403940 res!232936) b!403945))

(assert (= (and b!403945 res!232935) b!403946))

(assert (= (and b!403946 res!232929) b!403943))

(assert (= (and b!403943 res!232937) b!403948))

(assert (= (and b!403948 res!232931) b!403944))

(assert (= (and b!403944 res!232938) b!403939))

(assert (= (and b!403947 condMapEmpty!16905) mapIsEmpty!16905))

(assert (= (and b!403947 (not condMapEmpty!16905)) mapNonEmpty!16905))

(get-info :version)

(assert (= (and mapNonEmpty!16905 ((_ is ValueCellFull!4751) mapValue!16905)) b!403941))

(assert (= (and b!403947 ((_ is ValueCellFull!4751) mapDefault!16905)) b!403936))

(assert (= start!38756 b!403947))

(declare-fun m!396411 () Bool)

(assert (=> b!403939 m!396411))

(declare-fun m!396413 () Bool)

(assert (=> b!403942 m!396413))

(declare-fun m!396415 () Bool)

(assert (=> b!403940 m!396415))

(declare-fun m!396417 () Bool)

(assert (=> b!403948 m!396417))

(declare-fun m!396419 () Bool)

(assert (=> b!403944 m!396419))

(declare-fun m!396421 () Bool)

(assert (=> b!403944 m!396421))

(declare-fun m!396423 () Bool)

(assert (=> mapNonEmpty!16905 m!396423))

(declare-fun m!396425 () Bool)

(assert (=> b!403946 m!396425))

(declare-fun m!396427 () Bool)

(assert (=> b!403937 m!396427))

(declare-fun m!396429 () Bool)

(assert (=> start!38756 m!396429))

(declare-fun m!396431 () Bool)

(assert (=> start!38756 m!396431))

(declare-fun m!396433 () Bool)

(assert (=> b!403943 m!396433))

(check-sat (not b!403946) (not b!403944) (not b!403948) tp_is_empty!10189 (not mapNonEmpty!16905) (not b!403942) (not b!403940) (not b!403937) (not b!403939) (not start!38756))
(check-sat)
