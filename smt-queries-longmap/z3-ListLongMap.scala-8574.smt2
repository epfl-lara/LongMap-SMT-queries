; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104648 () Bool)

(assert start!104648)

(declare-fun b!1247729 () Bool)

(declare-fun e!707931 () Bool)

(declare-datatypes ((array!80375 0))(
  ( (array!80376 (arr!38757 (Array (_ BitVec 32) (_ BitVec 64))) (size!39295 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80375)

(assert (=> b!1247729 (= e!707931 (bvsgt #b00000000000000000000000000000000 (size!39295 _keys!1118)))))

(declare-fun mapNonEmpty!48826 () Bool)

(declare-fun mapRes!48826 () Bool)

(declare-fun tp!92927 () Bool)

(declare-fun e!707928 () Bool)

(assert (=> mapNonEmpty!48826 (= mapRes!48826 (and tp!92927 e!707928))))

(declare-datatypes ((V!47207 0))(
  ( (V!47208 (val!15753 Int)) )
))
(declare-datatypes ((ValueCell!14927 0))(
  ( (ValueCellFull!14927 (v!18448 V!47207)) (EmptyCell!14927) )
))
(declare-fun mapRest!48826 () (Array (_ BitVec 32) ValueCell!14927))

(declare-datatypes ((array!80377 0))(
  ( (array!80378 (arr!38758 (Array (_ BitVec 32) ValueCell!14927)) (size!39296 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80377)

(declare-fun mapKey!48826 () (_ BitVec 32))

(declare-fun mapValue!48826 () ValueCell!14927)

(assert (=> mapNonEmpty!48826 (= (arr!38758 _values!914) (store mapRest!48826 mapKey!48826 mapValue!48826))))

(declare-fun b!1247730 () Bool)

(declare-fun res!832517 () Bool)

(assert (=> b!1247730 (=> (not res!832517) (not e!707931))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247730 (= res!832517 (and (= (size!39296 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39295 _keys!1118) (size!39296 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247731 () Bool)

(declare-fun e!707930 () Bool)

(declare-fun e!707929 () Bool)

(assert (=> b!1247731 (= e!707930 (and e!707929 mapRes!48826))))

(declare-fun condMapEmpty!48826 () Bool)

(declare-fun mapDefault!48826 () ValueCell!14927)

(assert (=> b!1247731 (= condMapEmpty!48826 (= (arr!38758 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14927)) mapDefault!48826)))))

(declare-fun b!1247732 () Bool)

(declare-fun res!832516 () Bool)

(assert (=> b!1247732 (=> (not res!832516) (not e!707931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80375 (_ BitVec 32)) Bool)

(assert (=> b!1247732 (= res!832516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!48826 () Bool)

(assert (=> mapIsEmpty!48826 mapRes!48826))

(declare-fun b!1247733 () Bool)

(declare-fun res!832514 () Bool)

(assert (=> b!1247733 (=> (not res!832514) (not e!707931))))

(declare-datatypes ((List!27604 0))(
  ( (Nil!27601) (Cons!27600 (h!28809 (_ BitVec 64)) (t!41064 List!27604)) )
))
(declare-fun arrayNoDuplicates!0 (array!80375 (_ BitVec 32) List!27604) Bool)

(assert (=> b!1247733 (= res!832514 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27601))))

(declare-fun res!832515 () Bool)

(assert (=> start!104648 (=> (not res!832515) (not e!707931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104648 (= res!832515 (validMask!0 mask!1466))))

(assert (=> start!104648 e!707931))

(assert (=> start!104648 true))

(declare-fun array_inv!29715 (array!80375) Bool)

(assert (=> start!104648 (array_inv!29715 _keys!1118)))

(declare-fun array_inv!29716 (array!80377) Bool)

(assert (=> start!104648 (and (array_inv!29716 _values!914) e!707930)))

(declare-fun b!1247734 () Bool)

(declare-fun tp_is_empty!31381 () Bool)

(assert (=> b!1247734 (= e!707928 tp_is_empty!31381)))

(declare-fun b!1247735 () Bool)

(assert (=> b!1247735 (= e!707929 tp_is_empty!31381)))

(assert (= (and start!104648 res!832515) b!1247730))

(assert (= (and b!1247730 res!832517) b!1247732))

(assert (= (and b!1247732 res!832516) b!1247733))

(assert (= (and b!1247733 res!832514) b!1247729))

(assert (= (and b!1247731 condMapEmpty!48826) mapIsEmpty!48826))

(assert (= (and b!1247731 (not condMapEmpty!48826)) mapNonEmpty!48826))

(get-info :version)

(assert (= (and mapNonEmpty!48826 ((_ is ValueCellFull!14927) mapValue!48826)) b!1247734))

(assert (= (and b!1247731 ((_ is ValueCellFull!14927) mapDefault!48826)) b!1247735))

(assert (= start!104648 b!1247731))

(declare-fun m!1148675 () Bool)

(assert (=> mapNonEmpty!48826 m!1148675))

(declare-fun m!1148677 () Bool)

(assert (=> b!1247732 m!1148677))

(declare-fun m!1148679 () Bool)

(assert (=> b!1247733 m!1148679))

(declare-fun m!1148681 () Bool)

(assert (=> start!104648 m!1148681))

(declare-fun m!1148683 () Bool)

(assert (=> start!104648 m!1148683))

(declare-fun m!1148685 () Bool)

(assert (=> start!104648 m!1148685))

(check-sat (not b!1247733) (not b!1247732) (not start!104648) (not mapNonEmpty!48826) tp_is_empty!31381)
(check-sat)
(get-model)

(declare-fun d!137653 () Bool)

(declare-fun res!832548 () Bool)

(declare-fun e!707972 () Bool)

(assert (=> d!137653 (=> res!832548 e!707972)))

(assert (=> d!137653 (= res!832548 (bvsge #b00000000000000000000000000000000 (size!39295 _keys!1118)))))

(assert (=> d!137653 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27601) e!707972)))

(declare-fun b!1247788 () Bool)

(declare-fun e!707974 () Bool)

(declare-fun call!61547 () Bool)

(assert (=> b!1247788 (= e!707974 call!61547)))

(declare-fun b!1247789 () Bool)

(declare-fun e!707973 () Bool)

(declare-fun contains!7441 (List!27604 (_ BitVec 64)) Bool)

(assert (=> b!1247789 (= e!707973 (contains!7441 Nil!27601 (select (arr!38757 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61544 () Bool)

(declare-fun c!122085 () Bool)

(assert (=> bm!61544 (= call!61547 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122085 (Cons!27600 (select (arr!38757 _keys!1118) #b00000000000000000000000000000000) Nil!27601) Nil!27601)))))

(declare-fun b!1247790 () Bool)

(declare-fun e!707971 () Bool)

(assert (=> b!1247790 (= e!707971 e!707974)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247790 (= c!122085 (validKeyInArray!0 (select (arr!38757 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1247791 () Bool)

(assert (=> b!1247791 (= e!707974 call!61547)))

(declare-fun b!1247792 () Bool)

(assert (=> b!1247792 (= e!707972 e!707971)))

(declare-fun res!832549 () Bool)

(assert (=> b!1247792 (=> (not res!832549) (not e!707971))))

(assert (=> b!1247792 (= res!832549 (not e!707973))))

(declare-fun res!832550 () Bool)

(assert (=> b!1247792 (=> (not res!832550) (not e!707973))))

(assert (=> b!1247792 (= res!832550 (validKeyInArray!0 (select (arr!38757 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!137653 (not res!832548)) b!1247792))

(assert (= (and b!1247792 res!832550) b!1247789))

(assert (= (and b!1247792 res!832549) b!1247790))

(assert (= (and b!1247790 c!122085) b!1247788))

(assert (= (and b!1247790 (not c!122085)) b!1247791))

(assert (= (or b!1247788 b!1247791) bm!61544))

(declare-fun m!1148711 () Bool)

(assert (=> b!1247789 m!1148711))

(assert (=> b!1247789 m!1148711))

(declare-fun m!1148713 () Bool)

(assert (=> b!1247789 m!1148713))

(assert (=> bm!61544 m!1148711))

(declare-fun m!1148715 () Bool)

(assert (=> bm!61544 m!1148715))

(assert (=> b!1247790 m!1148711))

(assert (=> b!1247790 m!1148711))

(declare-fun m!1148717 () Bool)

(assert (=> b!1247790 m!1148717))

(assert (=> b!1247792 m!1148711))

(assert (=> b!1247792 m!1148711))

(assert (=> b!1247792 m!1148717))

(assert (=> b!1247733 d!137653))

(declare-fun d!137655 () Bool)

(assert (=> d!137655 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104648 d!137655))

(declare-fun d!137657 () Bool)

(assert (=> d!137657 (= (array_inv!29715 _keys!1118) (bvsge (size!39295 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104648 d!137657))

(declare-fun d!137659 () Bool)

(assert (=> d!137659 (= (array_inv!29716 _values!914) (bvsge (size!39296 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104648 d!137659))

(declare-fun b!1247801 () Bool)

(declare-fun e!707983 () Bool)

(declare-fun call!61550 () Bool)

(assert (=> b!1247801 (= e!707983 call!61550)))

(declare-fun b!1247802 () Bool)

(declare-fun e!707982 () Bool)

(assert (=> b!1247802 (= e!707982 call!61550)))

(declare-fun b!1247803 () Bool)

(assert (=> b!1247803 (= e!707983 e!707982)))

(declare-fun lt!563148 () (_ BitVec 64))

(assert (=> b!1247803 (= lt!563148 (select (arr!38757 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41318 0))(
  ( (Unit!41319) )
))
(declare-fun lt!563150 () Unit!41318)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80375 (_ BitVec 64) (_ BitVec 32)) Unit!41318)

(assert (=> b!1247803 (= lt!563150 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563148 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1247803 (arrayContainsKey!0 _keys!1118 lt!563148 #b00000000000000000000000000000000)))

(declare-fun lt!563149 () Unit!41318)

(assert (=> b!1247803 (= lt!563149 lt!563150)))

(declare-fun res!832556 () Bool)

(declare-datatypes ((SeekEntryResult!9955 0))(
  ( (MissingZero!9955 (index!42191 (_ BitVec 32))) (Found!9955 (index!42192 (_ BitVec 32))) (Intermediate!9955 (undefined!10767 Bool) (index!42193 (_ BitVec 32)) (x!109677 (_ BitVec 32))) (Undefined!9955) (MissingVacant!9955 (index!42194 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80375 (_ BitVec 32)) SeekEntryResult!9955)

(assert (=> b!1247803 (= res!832556 (= (seekEntryOrOpen!0 (select (arr!38757 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9955 #b00000000000000000000000000000000)))))

(assert (=> b!1247803 (=> (not res!832556) (not e!707982))))

(declare-fun b!1247804 () Bool)

(declare-fun e!707981 () Bool)

(assert (=> b!1247804 (= e!707981 e!707983)))

(declare-fun c!122088 () Bool)

(assert (=> b!1247804 (= c!122088 (validKeyInArray!0 (select (arr!38757 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!137661 () Bool)

(declare-fun res!832555 () Bool)

(assert (=> d!137661 (=> res!832555 e!707981)))

(assert (=> d!137661 (= res!832555 (bvsge #b00000000000000000000000000000000 (size!39295 _keys!1118)))))

(assert (=> d!137661 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!707981)))

(declare-fun bm!61547 () Bool)

(assert (=> bm!61547 (= call!61550 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!137661 (not res!832555)) b!1247804))

(assert (= (and b!1247804 c!122088) b!1247803))

(assert (= (and b!1247804 (not c!122088)) b!1247801))

(assert (= (and b!1247803 res!832556) b!1247802))

(assert (= (or b!1247802 b!1247801) bm!61547))

(assert (=> b!1247803 m!1148711))

(declare-fun m!1148719 () Bool)

(assert (=> b!1247803 m!1148719))

(declare-fun m!1148721 () Bool)

(assert (=> b!1247803 m!1148721))

(assert (=> b!1247803 m!1148711))

(declare-fun m!1148723 () Bool)

(assert (=> b!1247803 m!1148723))

(assert (=> b!1247804 m!1148711))

(assert (=> b!1247804 m!1148711))

(assert (=> b!1247804 m!1148717))

(declare-fun m!1148725 () Bool)

(assert (=> bm!61547 m!1148725))

(assert (=> b!1247732 d!137661))

(declare-fun mapNonEmpty!48835 () Bool)

(declare-fun mapRes!48835 () Bool)

(declare-fun tp!92936 () Bool)

(declare-fun e!707988 () Bool)

(assert (=> mapNonEmpty!48835 (= mapRes!48835 (and tp!92936 e!707988))))

(declare-fun mapValue!48835 () ValueCell!14927)

(declare-fun mapRest!48835 () (Array (_ BitVec 32) ValueCell!14927))

(declare-fun mapKey!48835 () (_ BitVec 32))

(assert (=> mapNonEmpty!48835 (= mapRest!48826 (store mapRest!48835 mapKey!48835 mapValue!48835))))

(declare-fun b!1247811 () Bool)

(assert (=> b!1247811 (= e!707988 tp_is_empty!31381)))

(declare-fun b!1247812 () Bool)

(declare-fun e!707989 () Bool)

(assert (=> b!1247812 (= e!707989 tp_is_empty!31381)))

(declare-fun condMapEmpty!48835 () Bool)

(declare-fun mapDefault!48835 () ValueCell!14927)

(assert (=> mapNonEmpty!48826 (= condMapEmpty!48835 (= mapRest!48826 ((as const (Array (_ BitVec 32) ValueCell!14927)) mapDefault!48835)))))

(assert (=> mapNonEmpty!48826 (= tp!92927 (and e!707989 mapRes!48835))))

(declare-fun mapIsEmpty!48835 () Bool)

(assert (=> mapIsEmpty!48835 mapRes!48835))

(assert (= (and mapNonEmpty!48826 condMapEmpty!48835) mapIsEmpty!48835))

(assert (= (and mapNonEmpty!48826 (not condMapEmpty!48835)) mapNonEmpty!48835))

(assert (= (and mapNonEmpty!48835 ((_ is ValueCellFull!14927) mapValue!48835)) b!1247811))

(assert (= (and mapNonEmpty!48826 ((_ is ValueCellFull!14927) mapDefault!48835)) b!1247812))

(declare-fun m!1148727 () Bool)

(assert (=> mapNonEmpty!48835 m!1148727))

(check-sat (not b!1247790) (not bm!61547) (not b!1247789) (not b!1247804) (not b!1247792) (not b!1247803) (not bm!61544) (not mapNonEmpty!48835) tp_is_empty!31381)
(check-sat)
