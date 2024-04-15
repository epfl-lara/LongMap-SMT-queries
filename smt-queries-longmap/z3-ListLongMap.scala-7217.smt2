; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92362 () Bool)

(assert start!92362)

(declare-fun b!1049927 () Bool)

(declare-fun res!699148 () Bool)

(declare-fun e!595749 () Bool)

(assert (=> b!1049927 (=> res!699148 e!595749)))

(declare-datatypes ((List!22162 0))(
  ( (Nil!22159) (Cons!22158 (h!23367 (_ BitVec 64)) (t!31460 List!22162)) )
))
(declare-fun contains!6100 (List!22162 (_ BitVec 64)) Bool)

(assert (=> b!1049927 (= res!699148 (contains!6100 Nil!22159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049928 () Bool)

(declare-fun res!699137 () Bool)

(assert (=> b!1049928 (=> res!699137 e!595749)))

(declare-fun noDuplicate!1525 (List!22162) Bool)

(assert (=> b!1049928 (= res!699137 (not (noDuplicate!1525 Nil!22159)))))

(declare-fun b!1049929 () Bool)

(declare-fun e!595750 () Bool)

(declare-fun e!595752 () Bool)

(assert (=> b!1049929 (= e!595750 e!595752)))

(declare-fun res!699140 () Bool)

(assert (=> b!1049929 (=> (not res!699140) (not e!595752))))

(declare-datatypes ((array!66104 0))(
  ( (array!66105 (arr!31791 (Array (_ BitVec 32) (_ BitVec 64))) (size!32329 (_ BitVec 32))) )
))
(declare-fun lt!463582 () array!66104)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049929 (= res!699140 (arrayContainsKey!0 lt!463582 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66104)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049929 (= lt!463582 (array!66105 (store (arr!31791 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32329 a!3488)))))

(declare-fun res!699144 () Bool)

(assert (=> start!92362 (=> (not res!699144) (not e!595750))))

(assert (=> start!92362 (= res!699144 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32329 a!3488)) (bvslt (size!32329 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92362 e!595750))

(assert (=> start!92362 true))

(declare-fun array_inv!24574 (array!66104) Bool)

(assert (=> start!92362 (array_inv!24574 a!3488)))

(declare-fun b!1049930 () Bool)

(declare-fun e!595755 () Bool)

(declare-fun e!595754 () Bool)

(assert (=> b!1049930 (= e!595755 e!595754)))

(declare-fun res!699145 () Bool)

(assert (=> b!1049930 (=> res!699145 e!595754)))

(declare-fun lt!463580 () (_ BitVec 32))

(assert (=> b!1049930 (= res!699145 (bvsle lt!463580 i!1381))))

(declare-fun b!1049931 () Bool)

(assert (=> b!1049931 (= e!595754 (arrayContainsKey!0 a!3488 k0!2747 lt!463580))))

(declare-fun b!1049932 () Bool)

(assert (=> b!1049932 (= e!595749 true)))

(declare-fun lt!463578 () Bool)

(assert (=> b!1049932 (= lt!463578 (contains!6100 Nil!22159 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049933 () Bool)

(declare-fun e!595748 () Bool)

(assert (=> b!1049933 (= e!595752 e!595748)))

(declare-fun res!699139 () Bool)

(assert (=> b!1049933 (=> (not res!699139) (not e!595748))))

(assert (=> b!1049933 (= res!699139 (not (= lt!463580 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66104 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049933 (= lt!463580 (arrayScanForKey!0 lt!463582 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049934 () Bool)

(declare-fun res!699143 () Bool)

(assert (=> b!1049934 (=> (not res!699143) (not e!595750))))

(assert (=> b!1049934 (= res!699143 (= (select (arr!31791 a!3488) i!1381) k0!2747))))

(declare-fun b!1049935 () Bool)

(declare-fun e!595751 () Bool)

(assert (=> b!1049935 (= e!595751 e!595749)))

(declare-fun res!699147 () Bool)

(assert (=> b!1049935 (=> res!699147 e!595749)))

(assert (=> b!1049935 (= res!699147 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32329 a!3488)))))

(assert (=> b!1049935 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34235 0))(
  ( (Unit!34236) )
))
(declare-fun lt!463579 () Unit!34235)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66104 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34235)

(assert (=> b!1049935 (= lt!463579 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463580 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66104 (_ BitVec 32) List!22162) Bool)

(assert (=> b!1049935 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22159)))

(declare-fun lt!463581 () Unit!34235)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66104 (_ BitVec 32) (_ BitVec 32)) Unit!34235)

(assert (=> b!1049935 (= lt!463581 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049936 () Bool)

(assert (=> b!1049936 (= e!595748 (not e!595751))))

(declare-fun res!699141 () Bool)

(assert (=> b!1049936 (=> res!699141 e!595751)))

(assert (=> b!1049936 (= res!699141 (bvsle lt!463580 i!1381))))

(assert (=> b!1049936 e!595755))

(declare-fun res!699142 () Bool)

(assert (=> b!1049936 (=> (not res!699142) (not e!595755))))

(assert (=> b!1049936 (= res!699142 (= (select (store (arr!31791 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463580) k0!2747))))

(declare-fun b!1049937 () Bool)

(declare-fun res!699138 () Bool)

(assert (=> b!1049937 (=> (not res!699138) (not e!595750))))

(assert (=> b!1049937 (= res!699138 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22159))))

(declare-fun b!1049938 () Bool)

(declare-fun res!699146 () Bool)

(assert (=> b!1049938 (=> (not res!699146) (not e!595750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049938 (= res!699146 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92362 res!699144) b!1049937))

(assert (= (and b!1049937 res!699138) b!1049938))

(assert (= (and b!1049938 res!699146) b!1049934))

(assert (= (and b!1049934 res!699143) b!1049929))

(assert (= (and b!1049929 res!699140) b!1049933))

(assert (= (and b!1049933 res!699139) b!1049936))

(assert (= (and b!1049936 res!699142) b!1049930))

(assert (= (and b!1049930 (not res!699145)) b!1049931))

(assert (= (and b!1049936 (not res!699141)) b!1049935))

(assert (= (and b!1049935 (not res!699147)) b!1049928))

(assert (= (and b!1049928 (not res!699137)) b!1049927))

(assert (= (and b!1049927 (not res!699148)) b!1049932))

(declare-fun m!970153 () Bool)

(assert (=> b!1049935 m!970153))

(declare-fun m!970155 () Bool)

(assert (=> b!1049935 m!970155))

(declare-fun m!970157 () Bool)

(assert (=> b!1049935 m!970157))

(declare-fun m!970159 () Bool)

(assert (=> b!1049935 m!970159))

(declare-fun m!970161 () Bool)

(assert (=> b!1049932 m!970161))

(declare-fun m!970163 () Bool)

(assert (=> b!1049928 m!970163))

(declare-fun m!970165 () Bool)

(assert (=> b!1049927 m!970165))

(declare-fun m!970167 () Bool)

(assert (=> b!1049938 m!970167))

(declare-fun m!970169 () Bool)

(assert (=> b!1049936 m!970169))

(declare-fun m!970171 () Bool)

(assert (=> b!1049936 m!970171))

(declare-fun m!970173 () Bool)

(assert (=> b!1049937 m!970173))

(declare-fun m!970175 () Bool)

(assert (=> b!1049934 m!970175))

(declare-fun m!970177 () Bool)

(assert (=> b!1049929 m!970177))

(assert (=> b!1049929 m!970169))

(declare-fun m!970179 () Bool)

(assert (=> start!92362 m!970179))

(declare-fun m!970181 () Bool)

(assert (=> b!1049931 m!970181))

(declare-fun m!970183 () Bool)

(assert (=> b!1049933 m!970183))

(check-sat (not b!1049927) (not b!1049938) (not start!92362) (not b!1049933) (not b!1049937) (not b!1049931) (not b!1049935) (not b!1049928) (not b!1049932) (not b!1049929))
(check-sat)
