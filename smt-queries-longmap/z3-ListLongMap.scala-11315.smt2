; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132206 () Bool)

(assert start!132206)

(declare-fun b!1545537 () Bool)

(declare-fun e!860191 () Bool)

(assert (=> b!1545537 (= e!860191 false)))

(declare-fun lt!666835 () Bool)

(declare-datatypes ((array!102912 0))(
  ( (array!102913 (arr!49651 (Array (_ BitVec 32) (_ BitVec 64))) (size!50202 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102912)

(declare-datatypes ((List!35941 0))(
  ( (Nil!35938) (Cons!35937 (h!37400 (_ BitVec 64)) (t!50627 List!35941)) )
))
(declare-fun arrayNoDuplicates!0 (array!102912 (_ BitVec 32) List!35941) Bool)

(assert (=> b!1545537 (= lt!666835 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35938))))

(declare-fun mapNonEmpty!58378 () Bool)

(declare-fun mapRes!58378 () Bool)

(declare-fun tp!110905 () Bool)

(declare-fun e!860193 () Bool)

(assert (=> mapNonEmpty!58378 (= mapRes!58378 (and tp!110905 e!860193))))

(declare-datatypes ((V!58821 0))(
  ( (V!58822 (val!18969 Int)) )
))
(declare-datatypes ((ValueCell!17981 0))(
  ( (ValueCellFull!17981 (v!21762 V!58821)) (EmptyCell!17981) )
))
(declare-fun mapValue!58378 () ValueCell!17981)

(declare-datatypes ((array!102914 0))(
  ( (array!102915 (arr!49652 (Array (_ BitVec 32) ValueCell!17981)) (size!50203 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102914)

(declare-fun mapKey!58378 () (_ BitVec 32))

(declare-fun mapRest!58378 () (Array (_ BitVec 32) ValueCell!17981))

(assert (=> mapNonEmpty!58378 (= (arr!49652 _values!470) (store mapRest!58378 mapKey!58378 mapValue!58378))))

(declare-fun mapIsEmpty!58378 () Bool)

(assert (=> mapIsEmpty!58378 mapRes!58378))

(declare-fun b!1545538 () Bool)

(declare-fun tp_is_empty!37783 () Bool)

(assert (=> b!1545538 (= e!860193 tp_is_empty!37783)))

(declare-fun b!1545539 () Bool)

(declare-fun res!1059686 () Bool)

(assert (=> b!1545539 (=> (not res!1059686) (not e!860191))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1545539 (= res!1059686 (and (= (size!50203 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50202 _keys!618) (size!50203 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545540 () Bool)

(declare-fun e!860189 () Bool)

(declare-fun e!860192 () Bool)

(assert (=> b!1545540 (= e!860189 (and e!860192 mapRes!58378))))

(declare-fun condMapEmpty!58378 () Bool)

(declare-fun mapDefault!58378 () ValueCell!17981)

(assert (=> b!1545540 (= condMapEmpty!58378 (= (arr!49652 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17981)) mapDefault!58378)))))

(declare-fun b!1545541 () Bool)

(declare-fun res!1059684 () Bool)

(assert (=> b!1545541 (=> (not res!1059684) (not e!860191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102912 (_ BitVec 32)) Bool)

(assert (=> b!1545541 (= res!1059684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545542 () Bool)

(assert (=> b!1545542 (= e!860192 tp_is_empty!37783)))

(declare-fun res!1059685 () Bool)

(assert (=> start!132206 (=> (not res!1059685) (not e!860191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132206 (= res!1059685 (validMask!0 mask!926))))

(assert (=> start!132206 e!860191))

(assert (=> start!132206 true))

(declare-fun array_inv!38891 (array!102914) Bool)

(assert (=> start!132206 (and (array_inv!38891 _values!470) e!860189)))

(declare-fun array_inv!38892 (array!102912) Bool)

(assert (=> start!132206 (array_inv!38892 _keys!618)))

(assert (= (and start!132206 res!1059685) b!1545539))

(assert (= (and b!1545539 res!1059686) b!1545541))

(assert (= (and b!1545541 res!1059684) b!1545537))

(assert (= (and b!1545540 condMapEmpty!58378) mapIsEmpty!58378))

(assert (= (and b!1545540 (not condMapEmpty!58378)) mapNonEmpty!58378))

(get-info :version)

(assert (= (and mapNonEmpty!58378 ((_ is ValueCellFull!17981) mapValue!58378)) b!1545538))

(assert (= (and b!1545540 ((_ is ValueCellFull!17981) mapDefault!58378)) b!1545542))

(assert (= start!132206 b!1545540))

(declare-fun m!1426779 () Bool)

(assert (=> b!1545537 m!1426779))

(declare-fun m!1426781 () Bool)

(assert (=> mapNonEmpty!58378 m!1426781))

(declare-fun m!1426783 () Bool)

(assert (=> b!1545541 m!1426783))

(declare-fun m!1426785 () Bool)

(assert (=> start!132206 m!1426785))

(declare-fun m!1426787 () Bool)

(assert (=> start!132206 m!1426787))

(declare-fun m!1426789 () Bool)

(assert (=> start!132206 m!1426789))

(check-sat (not start!132206) (not b!1545541) tp_is_empty!37783 (not mapNonEmpty!58378) (not b!1545537))
(check-sat)
