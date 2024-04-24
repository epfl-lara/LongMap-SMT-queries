; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75858 () Bool)

(assert start!75858)

(declare-fun b!890835 () Bool)

(declare-fun b_free!15661 () Bool)

(declare-fun b_next!15661 () Bool)

(assert (=> b!890835 (= b_free!15661 (not b_next!15661))))

(declare-fun tp!54952 () Bool)

(declare-fun b_and!25911 () Bool)

(assert (=> b!890835 (= tp!54952 b_and!25911)))

(declare-fun b!890833 () Bool)

(declare-fun e!496754 () Bool)

(declare-fun tp_is_empty!17989 () Bool)

(assert (=> b!890833 (= e!496754 tp_is_empty!17989)))

(declare-fun b!890834 () Bool)

(declare-fun e!496750 () Bool)

(assert (=> b!890834 (= e!496750 false)))

(declare-fun lt!402502 () Bool)

(declare-datatypes ((array!51997 0))(
  ( (array!51998 (arr!25000 (Array (_ BitVec 32) (_ BitVec 64))) (size!25445 (_ BitVec 32))) )
))
(declare-datatypes ((V!28951 0))(
  ( (V!28952 (val!9045 Int)) )
))
(declare-datatypes ((ValueCell!8513 0))(
  ( (ValueCellFull!8513 (v!11520 V!28951)) (EmptyCell!8513) )
))
(declare-datatypes ((array!51999 0))(
  ( (array!52000 (arr!25001 (Array (_ BitVec 32) ValueCell!8513)) (size!25446 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4042 0))(
  ( (LongMapFixedSize!4043 (defaultEntry!5218 Int) (mask!25722 (_ BitVec 32)) (extraKeys!4912 (_ BitVec 32)) (zeroValue!5016 V!28951) (minValue!5016 V!28951) (_size!2076 (_ BitVec 32)) (_keys!9929 array!51997) (_values!5203 array!51999) (_vacant!2076 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4042)

(declare-datatypes ((List!17668 0))(
  ( (Nil!17665) (Cons!17664 (h!18801 (_ BitVec 64)) (t!24959 List!17668)) )
))
(declare-fun arrayNoDuplicates!0 (array!51997 (_ BitVec 32) List!17668) Bool)

(assert (=> b!890834 (= lt!402502 (arrayNoDuplicates!0 (_keys!9929 thiss!1181) #b00000000000000000000000000000000 Nil!17665))))

(declare-fun e!496749 () Bool)

(declare-fun e!496755 () Bool)

(declare-fun array_inv!19708 (array!51997) Bool)

(declare-fun array_inv!19709 (array!51999) Bool)

(assert (=> b!890835 (= e!496755 (and tp!54952 tp_is_empty!17989 (array_inv!19708 (_keys!9929 thiss!1181)) (array_inv!19709 (_values!5203 thiss!1181)) e!496749))))

(declare-fun res!603403 () Bool)

(declare-fun e!496751 () Bool)

(assert (=> start!75858 (=> (not res!603403) (not e!496751))))

(declare-fun valid!1583 (LongMapFixedSize!4042) Bool)

(assert (=> start!75858 (= res!603403 (valid!1583 thiss!1181))))

(assert (=> start!75858 e!496751))

(assert (=> start!75858 e!496755))

(assert (=> start!75858 true))

(declare-fun b!890836 () Bool)

(declare-fun res!603402 () Bool)

(assert (=> b!890836 (=> (not res!603402) (not e!496750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51997 (_ BitVec 32)) Bool)

(assert (=> b!890836 (= res!603402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9929 thiss!1181) (mask!25722 thiss!1181)))))

(declare-fun b!890837 () Bool)

(declare-fun mapRes!28538 () Bool)

(assert (=> b!890837 (= e!496749 (and e!496754 mapRes!28538))))

(declare-fun condMapEmpty!28538 () Bool)

(declare-fun mapDefault!28538 () ValueCell!8513)

(assert (=> b!890837 (= condMapEmpty!28538 (= (arr!25001 (_values!5203 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8513)) mapDefault!28538)))))

(declare-fun b!890838 () Bool)

(declare-fun e!496753 () Bool)

(assert (=> b!890838 (= e!496753 tp_is_empty!17989)))

(declare-fun mapIsEmpty!28538 () Bool)

(assert (=> mapIsEmpty!28538 mapRes!28538))

(declare-fun b!890839 () Bool)

(assert (=> b!890839 (= e!496751 e!496750)))

(declare-fun res!603399 () Bool)

(assert (=> b!890839 (=> (not res!603399) (not e!496750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890839 (= res!603399 (validMask!0 (mask!25722 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8740 0))(
  ( (MissingZero!8740 (index!37331 (_ BitVec 32))) (Found!8740 (index!37332 (_ BitVec 32))) (Intermediate!8740 (undefined!9552 Bool) (index!37333 (_ BitVec 32)) (x!75546 (_ BitVec 32))) (Undefined!8740) (MissingVacant!8740 (index!37334 (_ BitVec 32))) )
))
(declare-fun lt!402503 () SeekEntryResult!8740)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51997 (_ BitVec 32)) SeekEntryResult!8740)

(assert (=> b!890839 (= lt!402503 (seekEntry!0 key!785 (_keys!9929 thiss!1181) (mask!25722 thiss!1181)))))

(declare-fun b!890840 () Bool)

(declare-fun res!603400 () Bool)

(assert (=> b!890840 (=> (not res!603400) (not e!496751))))

(assert (=> b!890840 (= res!603400 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!28538 () Bool)

(declare-fun tp!54953 () Bool)

(assert (=> mapNonEmpty!28538 (= mapRes!28538 (and tp!54953 e!496753))))

(declare-fun mapKey!28538 () (_ BitVec 32))

(declare-fun mapRest!28538 () (Array (_ BitVec 32) ValueCell!8513))

(declare-fun mapValue!28538 () ValueCell!8513)

(assert (=> mapNonEmpty!28538 (= (arr!25001 (_values!5203 thiss!1181)) (store mapRest!28538 mapKey!28538 mapValue!28538))))

(declare-fun b!890841 () Bool)

(declare-fun res!603401 () Bool)

(assert (=> b!890841 (=> (not res!603401) (not e!496750))))

(assert (=> b!890841 (= res!603401 (and (= (size!25446 (_values!5203 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25722 thiss!1181))) (= (size!25445 (_keys!9929 thiss!1181)) (size!25446 (_values!5203 thiss!1181))) (bvsge (mask!25722 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4912 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4912 thiss!1181) #b00000000000000000000000000000011)))))

(assert (= (and start!75858 res!603403) b!890840))

(assert (= (and b!890840 res!603400) b!890839))

(assert (= (and b!890839 res!603399) b!890841))

(assert (= (and b!890841 res!603401) b!890836))

(assert (= (and b!890836 res!603402) b!890834))

(assert (= (and b!890837 condMapEmpty!28538) mapIsEmpty!28538))

(assert (= (and b!890837 (not condMapEmpty!28538)) mapNonEmpty!28538))

(get-info :version)

(assert (= (and mapNonEmpty!28538 ((_ is ValueCellFull!8513) mapValue!28538)) b!890838))

(assert (= (and b!890837 ((_ is ValueCellFull!8513) mapDefault!28538)) b!890833))

(assert (= b!890835 b!890837))

(assert (= start!75858 b!890835))

(declare-fun m!829939 () Bool)

(assert (=> b!890836 m!829939))

(declare-fun m!829941 () Bool)

(assert (=> mapNonEmpty!28538 m!829941))

(declare-fun m!829943 () Bool)

(assert (=> b!890835 m!829943))

(declare-fun m!829945 () Bool)

(assert (=> b!890835 m!829945))

(declare-fun m!829947 () Bool)

(assert (=> b!890839 m!829947))

(declare-fun m!829949 () Bool)

(assert (=> b!890839 m!829949))

(declare-fun m!829951 () Bool)

(assert (=> start!75858 m!829951))

(declare-fun m!829953 () Bool)

(assert (=> b!890834 m!829953))

(check-sat (not b!890839) (not b!890835) (not b!890836) (not b!890834) (not mapNonEmpty!28538) tp_is_empty!17989 (not start!75858) (not b_next!15661) b_and!25911)
(check-sat b_and!25911 (not b_next!15661))
