; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38760 () Bool)

(assert start!38760)

(declare-fun res!232914 () Bool)

(declare-fun e!243117 () Bool)

(assert (=> start!38760 (=> (not res!232914) (not e!243117))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24255 0))(
  ( (array!24256 (arr!11577 (Array (_ BitVec 32) (_ BitVec 64))) (size!11929 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24255)

(assert (=> start!38760 (= res!232914 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11929 _keys!709))))))

(assert (=> start!38760 e!243117))

(assert (=> start!38760 true))

(declare-datatypes ((V!14677 0))(
  ( (V!14678 (val!5134 Int)) )
))
(declare-datatypes ((ValueCell!4746 0))(
  ( (ValueCellFull!4746 (v!7381 V!14677)) (EmptyCell!4746) )
))
(declare-datatypes ((array!24257 0))(
  ( (array!24258 (arr!11578 (Array (_ BitVec 32) ValueCell!4746)) (size!11930 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24257)

(declare-fun e!243118 () Bool)

(declare-fun array_inv!8470 (array!24257) Bool)

(assert (=> start!38760 (and (array_inv!8470 _values!549) e!243118)))

(declare-fun array_inv!8471 (array!24255) Bool)

(assert (=> start!38760 (array_inv!8471 _keys!709)))

(declare-fun b!404012 () Bool)

(declare-fun res!232916 () Bool)

(assert (=> b!404012 (=> (not res!232916) (not e!243117))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!404012 (= res!232916 (and (= (size!11930 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11929 _keys!709) (size!11930 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404013 () Bool)

(declare-fun e!243119 () Bool)

(assert (=> b!404013 (= e!243117 e!243119)))

(declare-fun res!232913 () Bool)

(assert (=> b!404013 (=> (not res!232913) (not e!243119))))

(declare-fun lt!188117 () array!24255)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24255 (_ BitVec 32)) Bool)

(assert (=> b!404013 (= res!232913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188117 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404013 (= lt!188117 (array!24256 (store (arr!11577 _keys!709) i!563 k0!794) (size!11929 _keys!709)))))

(declare-fun b!404014 () Bool)

(declare-fun res!232915 () Bool)

(assert (=> b!404014 (=> (not res!232915) (not e!243117))))

(assert (=> b!404014 (= res!232915 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11929 _keys!709))))))

(declare-fun b!404015 () Bool)

(declare-fun e!243116 () Bool)

(declare-fun tp_is_empty!10179 () Bool)

(assert (=> b!404015 (= e!243116 tp_is_empty!10179)))

(declare-fun b!404016 () Bool)

(declare-fun res!232917 () Bool)

(assert (=> b!404016 (=> (not res!232917) (not e!243117))))

(assert (=> b!404016 (= res!232917 (or (= (select (arr!11577 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11577 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16890 () Bool)

(declare-fun mapRes!16890 () Bool)

(assert (=> mapIsEmpty!16890 mapRes!16890))

(declare-fun b!404017 () Bool)

(declare-fun res!232909 () Bool)

(assert (=> b!404017 (=> (not res!232909) (not e!243117))))

(assert (=> b!404017 (= res!232909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404018 () Bool)

(declare-fun e!243120 () Bool)

(assert (=> b!404018 (= e!243120 tp_is_empty!10179)))

(declare-fun b!404019 () Bool)

(declare-fun res!232908 () Bool)

(assert (=> b!404019 (=> (not res!232908) (not e!243117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404019 (= res!232908 (validMask!0 mask!1025))))

(declare-fun b!404020 () Bool)

(declare-fun res!232911 () Bool)

(assert (=> b!404020 (=> (not res!232911) (not e!243117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404020 (= res!232911 (validKeyInArray!0 k0!794))))

(declare-fun b!404021 () Bool)

(assert (=> b!404021 (= e!243118 (and e!243116 mapRes!16890))))

(declare-fun condMapEmpty!16890 () Bool)

(declare-fun mapDefault!16890 () ValueCell!4746)

(assert (=> b!404021 (= condMapEmpty!16890 (= (arr!11578 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4746)) mapDefault!16890)))))

(declare-fun b!404022 () Bool)

(declare-fun res!232912 () Bool)

(assert (=> b!404022 (=> (not res!232912) (not e!243117))))

(declare-fun arrayContainsKey!0 (array!24255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404022 (= res!232912 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404023 () Bool)

(declare-fun res!232910 () Bool)

(assert (=> b!404023 (=> (not res!232910) (not e!243117))))

(declare-datatypes ((List!6744 0))(
  ( (Nil!6741) (Cons!6740 (h!7596 (_ BitVec 64)) (t!11918 List!6744)) )
))
(declare-fun arrayNoDuplicates!0 (array!24255 (_ BitVec 32) List!6744) Bool)

(assert (=> b!404023 (= res!232910 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6741))))

(declare-fun b!404024 () Bool)

(assert (=> b!404024 (= e!243119 false)))

(declare-fun lt!188116 () Bool)

(assert (=> b!404024 (= lt!188116 (arrayNoDuplicates!0 lt!188117 #b00000000000000000000000000000000 Nil!6741))))

(declare-fun mapNonEmpty!16890 () Bool)

(declare-fun tp!33009 () Bool)

(assert (=> mapNonEmpty!16890 (= mapRes!16890 (and tp!33009 e!243120))))

(declare-fun mapRest!16890 () (Array (_ BitVec 32) ValueCell!4746))

(declare-fun mapKey!16890 () (_ BitVec 32))

(declare-fun mapValue!16890 () ValueCell!4746)

(assert (=> mapNonEmpty!16890 (= (arr!11578 _values!549) (store mapRest!16890 mapKey!16890 mapValue!16890))))

(assert (= (and start!38760 res!232914) b!404019))

(assert (= (and b!404019 res!232908) b!404012))

(assert (= (and b!404012 res!232916) b!404017))

(assert (= (and b!404017 res!232909) b!404023))

(assert (= (and b!404023 res!232910) b!404014))

(assert (= (and b!404014 res!232915) b!404020))

(assert (= (and b!404020 res!232911) b!404016))

(assert (= (and b!404016 res!232917) b!404022))

(assert (= (and b!404022 res!232912) b!404013))

(assert (= (and b!404013 res!232913) b!404024))

(assert (= (and b!404021 condMapEmpty!16890) mapIsEmpty!16890))

(assert (= (and b!404021 (not condMapEmpty!16890)) mapNonEmpty!16890))

(get-info :version)

(assert (= (and mapNonEmpty!16890 ((_ is ValueCellFull!4746) mapValue!16890)) b!404018))

(assert (= (and b!404021 ((_ is ValueCellFull!4746) mapDefault!16890)) b!404015))

(assert (= start!38760 b!404021))

(declare-fun m!397015 () Bool)

(assert (=> b!404020 m!397015))

(declare-fun m!397017 () Bool)

(assert (=> b!404016 m!397017))

(declare-fun m!397019 () Bool)

(assert (=> b!404017 m!397019))

(declare-fun m!397021 () Bool)

(assert (=> b!404023 m!397021))

(declare-fun m!397023 () Bool)

(assert (=> b!404024 m!397023))

(declare-fun m!397025 () Bool)

(assert (=> mapNonEmpty!16890 m!397025))

(declare-fun m!397027 () Bool)

(assert (=> b!404013 m!397027))

(declare-fun m!397029 () Bool)

(assert (=> b!404013 m!397029))

(declare-fun m!397031 () Bool)

(assert (=> b!404019 m!397031))

(declare-fun m!397033 () Bool)

(assert (=> b!404022 m!397033))

(declare-fun m!397035 () Bool)

(assert (=> start!38760 m!397035))

(declare-fun m!397037 () Bool)

(assert (=> start!38760 m!397037))

(check-sat (not start!38760) (not mapNonEmpty!16890) (not b!404019) (not b!404023) tp_is_empty!10179 (not b!404013) (not b!404022) (not b!404020) (not b!404024) (not b!404017))
(check-sat)
